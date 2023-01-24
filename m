Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80567679BC6
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 15:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbjAXO1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 09:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbjAXO1U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 09:27:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AA745BCF
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 06:27:17 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C68F8A9;
        Tue, 24 Jan 2023 15:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674570436;
        bh=h+1QcwUqxBGq74j++jvQAbtBQRut6I9xEyw+Pu/040I=;
        h=Date:To:Cc:From:Subject:From;
        b=U8xslfxGVd8UI8AaMYXzBfvizAgVxxkc7aoCP+b/rZJmdfobrJkb0RSDOWueIFAW3
         M9ggwgZ+kE7AyxDFeX4MyNfx37x9uqYM5E6k06OpfjmTbCXVFOM7d8jvyHqlBtdKPD
         HFrQybUWaCnGFtZULb8FazcsDjPINHHjkYYehCgQ=
Content-Type: multipart/mixed; boundary="------------XZCCT5drkVs4oq1lO3vNe3ff"
Message-ID: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
Date:   Tue, 24 Jan 2023 14:27:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Explicit status phase for DWC3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------XZCCT5drkVs4oq1lO3vNe3ff
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thinh


I'm trying to update the DWC3 driver to allow the status phase of a 
transaction to be explicit; meaning the gadget driver has the choice to 
either Ack or Stall _after_ the data phase so that the contents of the 
data phase can be validated. I thought that I should be able to achieve 
this by preventing dwc3_ep0_xfernotready() from calling 
dwc3_ep0_do_control_status() (relying on an "explicit_status" flag added 
to the usb_request to decide whether or not to do so) and then calling 
it manually later once the data phase was validated by the gadget driver 
(or indeed userspace). A very barebones version of my attempt to do that 
looks like this:


diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 81c486b3941c..c35436f3d3c3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -788,6 +788,7 @@ enum dwc3_ep0_state {
         EP0_SETUP_PHASE,
         EP0_DATA_PHASE,
         EP0_STATUS_PHASE,
+       EP0_AWAITING_EXPLICIT_STATUS,
  };

  enum dwc3_link_state {
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 5d642660fd15..692a99debcd9 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -894,10 +894,14 @@ static void dwc3_ep0_complete_data(struct dwc3 *dwc,
                 dwc->ep0_bounced = false;
         }

-       if ((epnum & 1) && ur->actual < ur->length)
+       if ((epnum & 1) && ur->actual < ur->length) {
                 dwc3_ep0_stall_and_restart(dwc);
-       else
+       } else {
+               if (r->request.explicit_status)
+                       dwc->ep0state = EP0_AWAITING_EXPLICIT_STATUS;
+
                 dwc3_gadget_giveback(ep0, r, 0);
+       }
  }

  static void dwc3_ep0_complete_status(struct dwc3 *dwc,
@@ -1111,6 +1115,15 @@ void dwc3_ep0_end_control_data(struct dwc3 *dwc, 
struct dwc3_ep *dep)
         dep->resource_index = 0;
  }

+void dwc3_gadget_ep0_control_ack(struct usb_ep *ep)
+{
+       struct dwc3_ep                  *dep = to_dwc3_ep(ep);
+       struct dwc3                     *dwc = dep->dwc;
+
+       dwc->ep0state = EP0_STATUS_PHASE;
+       __dwc3_ep0_do_control_status(dwc, dep);
+}
+
  static void dwc3_ep0_xfernotready(struct dwc3 *dwc,
                 const struct dwc3_event_depevt *event)
  {
@@ -1140,6 +1153,14 @@ static void dwc3_ep0_xfernotready(struct dwc3 *dwc,
                 if (dwc->ep0_next_event != DWC3_EP0_NRDY_STATUS)
                         return;

+               /*
+                * If the request asked for an explicit status stage 
hold off
+                * on sending the status until userspace asks us to.
+                */
+               if (dwc->ep0state == EP0_AWAITING_EXPLICIT_STATUS &&
+                   !event->endpoint_number)
+                       return;
+
                 dwc->ep0state = EP0_STATUS_PHASE;

                 if (dwc->delayed_status) {
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0d89dfa6eef5..85044bbbce02 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2228,6 +2228,7 @@ static const struct usb_ep_ops dwc3_gadget_ep0_ops = {
         .dequeue        = dwc3_gadget_ep_dequeue,
         .set_halt       = dwc3_gadget_ep0_set_halt,
         .set_wedge      = dwc3_gadget_ep_set_wedge,
+       .control_ack    = dwc3_gadget_ep0_control_ack,
  };

  static const struct usb_ep_ops dwc3_gadget_ep_ops = {
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 55a56cf67d73..4fc9737b54ca 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -116,6 +116,7 @@ int __dwc3_gadget_ep0_set_halt(struct usb_ep *ep, 
int value);
  int dwc3_gadget_ep0_set_halt(struct usb_ep *ep, int value);
  int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
                 gfp_t gfp_flags);
+void dwc3_gadget_ep0_control_ack(struct usb_ep *ep);
  int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int 
protocol);
  void dwc3_ep0_send_delayed_status(struct dwc3 *dwc);
  void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force, bool 
interrupt);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 3ad58b7a0824..6ee43966eafb 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -122,6 +122,8 @@ struct usb_request {

         int                     status;
         unsigned                actual;
+
+       bool                    explicit_status;
  };

  /*-------------------------------------------------------------------------*/
@@ -152,6 +154,7 @@ struct usb_ep_ops {

         int (*fifo_status) (struct usb_ep *ep);
         void (*fifo_flush) (struct usb_ep *ep);
+       void (*control_ack) (struct usb_ep *ep);
  };

  /**


And then the ack would be triggered by the gadget driver calling 
dwc3_gadget_ep0_control_ack() (in this case just through 
gadget->ep0->ops->control_ack(gadget->ep0), but probably I would 
abstract it out to the gadget layer or just mixed into usb_ep_queue() 
for ep0...).

When I do this, we do subsequently get the dwc3_ep0_xfer_complete() 
interrupt that calls dwc3_ep0_complete_status(), but the dwc3 gets stuck 
in the loop in dwc3_send_gadget_ep_cmd() immediately afterwards. It 
seems the "CMDACT" bit is never cleared (I assume that means "command 
active"...) but I can't see what's supposed to be clearing that so I 
assume it's internal firmware or something. I can't figure out how to 
proceed at this point, so I'm hoping you might have some advice about 
the right way to go about this. I attached a trace of the dwc3 events 
that shows the problem.

Side note; I realised when looking for your email that I started a 
thread about errors on the interrupt endpoint on the dwc3 and then 
abandoned it; sorry about that. Turns out the UVC gadget doesn't have 
any support for that endpoint anyway so I dropped it as low priority and 
forgot to reply to the thread.

Thanks
Dan

--------------XZCCT5drkVs4oq1lO3vNe3ff
Content-Type: application/gzip; name="trace.tar.gz"
Content-Disposition: attachment; filename="trace.tar.gz"
Content-Transfer-Encoding: base64

H4sICJ/oz2MAA3RyYWNlLnRhcgDtvW2PHMl5puvP/hUF+INHwHKYEc9LRBCWAFvS7grrlQ1L
xgFWEIR+qZ7h8QyHJjnS2vCPP0/2DLu6SHZUZVXkxZKPZ72WxhrqLjYjI6OuuOKOd2+ubrZf
vvu/7/5ivb+m+MtV539NxabH/zrJZPF38hdJxaXE/6T455Josb/YTCt+poe/vn/77urNZvMX
t//vm7c3V998829P/HOH/vM/07/+avNuHgFvXmxefff6L//qL/9qs3317s3L7dtnL189u/7+
7m775vn7/8uf3rx892776sWmTLU9n//XZrP5q398ofe/7sBff3g2//XTn21evvnXt8++u7t7
/nf/89nty7dX199sbw/+8uc//Pr45a+229tnb7Zvb74+/Mv+48dfF7/s66s3t5H8/O13d+/i
Xw/+yh9/afzK12+2229fv3t2u3397uvDv+6HXxi/7tuXX725erd9/3s84lfOv3T+63b7zdW/
7f3zv/3b3/yvZ//4q1/c/83P//Gf/+qHf/4/4j/51f/+5W9++7f/+x83m//+z7/++W9/9Q+/
/jDpP+L/7f79w6/88e9+/L//Zfyv7/948+yrq9uvtu++fPv1Mze7/49+Fw/p7zdfzn/F36Wc
vqzNteQXm9s/3cgf4pH47uYPb7b/+v327bsXm+3r6bvv41/j/7CZfvxLb6/9Nte7zTfbV1+9
+3ozPZ82//72V5ufxk9pWhLcJrXkxwdXzfV6m6cng/eyn3mTTwbLl2lKavJj8Jvt1e03LzZX
t7dvdr/Fendzra6bGNhvt+82N2XSzR+vvvl+G//I3f0/sjiv/pg3P3bbBYF6YqBPp/0GT87L
cJ7CeQ7nVXaAPkwBnxygyW7utu325iFQp+n9b9CayimB2guU6Xq7rUkeBe5+h9Npv0PrBXo2
kVudHgXWR4FpeOBNSdO2SH0UeHPu77A7ydS2vW7Ftw+BVw9/hicHts4gza55a2X3R5jO/g3W
qfcbXCMwdX6DcleyFLt59BQ++oHW+H+6OK/7FHYD02mBvffgGnn9p74X2E4L7M7bbbqJ7yn+
kJcf/wanbLp8xJTui/5AoJ4wRLsP/dU8a9/ePkxr88A895lovcC7bcrTNvmjwHMn7n5gvq4W
r7/HgedOay11B2k206vdq2meyx8H6tRODvzkU3ggbzoh7/1T/8M//Yft6z/cfHu7W3bH32z+
+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
bbB/bTAvN9j3NpiXG8yvDebXBvvXBvNrg31og/m1wfc3GsyvDebXBvNrg/m1wf0hBvvXBvNy
g3m5wbzcYH5tML822L82mF8b7F8bzK8N9qEN5tcO82uH/WuH+bXD/Nrh+yId5uUO83KHebnD
vNxhXu4wv3a4r8Rhnuywf+0wv3bYh3a4P8Rh/9ph/9rhvm2H+bXD/dcO95U4zOcd7itxmJc7
zK8d5tcO82uH+0oc7r92mF877F87zK8d7r92mJc7zMsd5uUO95U4zOcd9r0d7tt2mF873Ffi
ML92mF87zK8d7g9x2L92mF877F873LddYH5d4PsiC9y3XWA+X+C+kgLz8gLz6wLz6wLz6wL7
1wX2oQvMrwvcV1Jgfl3g+yILzMsLzMsLzMsL7HsXmM8X2C8vsF9eYH5dFB4vML8uML8uML8u
cP91gftKCsyvC9wfUmDfu8D8usB92wX2ywvM5wvct11gXl5gfl1gfl1gfl1g37vAPnSB+XWB
+0oKzK8L3LddYF5eYH5dYN+7wH3bBeblBeblFeblFeblFfa9K+x7V9i/rgkeL3DfdoX5dYX9
6wr71xXm5RXm5RX2vSvMyyvct11hPl9hfl3hfpQK+94V9r0r7HtXmF9XuK+kwn0lFebXFebX
FfavK8zLK+x7V5iXV5iXV5iXV5hfV5hfV9j3rrDvXWH/usL8usL9IRXm1xX2ryvsX1eYX1eY
X1fY964wL68wL68wL68wL68wv640T4b7URrMkxvsXzeYJzfYv26wf91g/7rB/nWD74tsML9u
sO/dYF7eYF7e4L7tBvPyBvvXDe7bbjBPbrB/3WCe3GAfusH8usF9Hg32rxvMyxvMrxvct93g
+ykbzOcbzK8b3LfdYJ7c4H6UBvPkBvvQDebJDfavG+xfN9iHbnDfdoN5eYP5dYP7thvMyxvs
l7cKj0+YlzeYJze4b7vB/nWD+XWD+XVj+7bLxPrXkYeOl8hDx0vkobwg8tD1UuTB45P1vSMP
ff9FHvo+ijx4fLL8ukwsv448eH5h/evIg+cXll+Xie0riTx4vLD+deTB8wvLy8vE9m1HHvw+
Yvl85MHjk+XlZWJ5cuTB44Xl15EHjxeWJ5eJ7duOPHi8sPw68uDxwvLyMrH+deTB44X1vSMP
5hMsL488eL3E8vIysb535MHzWYXnF9a/LhPbtx158Hhh+XXkweOF9a8jj51fEut7Rx77Pkow
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
GfbZM+yzC+yz83nsfCawzy6wzy6wzy6wzy6wzy6wzy6wzy6wzy6wz87nwfMZ7M8L7M8L7LML
7LML7LML7LML7LML7LML7LML7LPzefB8BvvzAvvzAvvzAvvzAvvzAvvzAvvzAvvzAvvzAvvz
fB48n8G+vsC+vsC+vsC+vsD+vMD+vMD+vMD+vMD+PJ8Hz2ewry+wry+wry+wry+wry+wry+w
ry+wry+wPy+wPy+wPy+wP8/nwfMZ7OsL7OsL7M8L7M8L7M8L7M8L7LML7LML7LPzefD8Avvz
AvvzAvvzAvvzAvvzAvvzAvvzAvvzfB48n8H+vMD+vMD+vMD+vMD+vMD+vMD+vMD+vMD+vMD+
vMD+PJ8Hz2ewry+wPy+wPy+wPy+wPy+wPy+wPy+wPy+wPy+wPy+0Pw/nKezPK+zPK+zPK+zP
K+zPK+zPK+zPK+zPK+zPK+zPK+yz83nwfAb78wr78wr78wr78wr78wr78wr78wr78wr783we
PJ/B/rzC/rzC/rzC/rzC/rzC/rzC/rzC/rzC/rzC/jyfB89nsD+vsD+vsD+vsD+vsD+vsD+v
sD+vsD+vsD+vsM/O58HzGezPK+zPK+zPK+zPK+zPK+zPK+zPK+zP83nwfAb7+gr7+gr78wr7
8wr78wr78wr33Svs6yvs6/N58HwGnw9Q+HyAwucDFPb1Ffb1Ffb1Ffb1Ffb1Ffb1Ffb1+Tx4
PoPPByjs6yvs6yvs6yvs6yvs6yvs6yvs6yvs6/N58HwGnw9Q+HyAwucDFPb1Ffb1Ffb1Ffb1
Ffb1Ffb1Ffb1Ffb1Ffb1Ffb1Ffb1Ffb1FfbnDfbnDfbnDfbnDfbnDfbn+Tx2PjPY1zfY1zfY
1zfY1zfYnzfYnzfYnzfYnzfYnzfYn+fz4PkM9vUN9vUN9vUN9ucN9ucN9ucN9ucN9ucN9uf5
PHg+g319g319g319g319g/15g/15g/15g/15g/15g312g312g312O9tn/4v/+uu//vqvv/7r
r//66/8/f/1/DetueQBYDAA=

--------------XZCCT5drkVs4oq1lO3vNe3ff--

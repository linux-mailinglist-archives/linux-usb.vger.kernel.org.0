Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D4F4007EF
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 00:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbhICWgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 18:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbhICWgn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 18:36:43 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44FCC061575
        for <linux-usb@vger.kernel.org>; Fri,  3 Sep 2021 15:35:36 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id d16so1042138ljq.4
        for <linux-usb@vger.kernel.org>; Fri, 03 Sep 2021 15:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=pdb2n8XCHm/H3ZSCnFG6cu2hozidM+jVyVm25Z4j2Ug=;
        b=oE/3t/6IUTdK9z6jK1rj7UvCjvbKdeOGWQ+gieRHl0HlfP3SWH9S2DrPow/dVyGJ1/
         nizbzK/eegvE5kjP+5fG3xcbd20SW7wqcpBVFn8bMd9rFsJOQWOyObz8awgR6/7YO46D
         VxhQLeBVGjK9jQI2w9gajX3FFI9HQD3PM1SeDhcN5tDggbHgQFQwh2dR/r67SAQ3/H6R
         wsjoaGGOgIadgpnFXGuSewNDDCh+JZrABTaoNmDyJzZAp/D+zW9gW4gLhhfwWdiWkA2o
         WQ/ziwN1gIi1lHSgb9PamPQdL8E25BpMH26Ojusg/fJjwtUWmb7dGC7fux62Z741j3lO
         Z+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pdb2n8XCHm/H3ZSCnFG6cu2hozidM+jVyVm25Z4j2Ug=;
        b=ZXwD7/u8KkNFw8/vggvQLWi+MMQU/hJjzT8/OdopB5AnpnxvCAJDB4CwGKvmllfVcJ
         eL7D6dU3F9DsLm+USY9fpNaR85kWmZcNPOBmsMd8fi4QuIRoOJCPGKhN6iQdNkMB7Gpa
         B2shvYq6N4RIeo8EqoUexrPaJiH/RBj7D/R+beiOqXQHBog6cCLyDRrMXPc662EITu15
         8SBxqNCrWFqa55D3hvXpuZhp/yPxiRmxncpYjWisdZ5slJf+wzPsIZVNlstmyKauAoKx
         0VbGUXoN++TNClpLxbphk05NUWfjnfKMbgu7gw2B6c7zNQ5kh3UYfLi+qLC3qN5+wwIX
         zl5w==
X-Gm-Message-State: AOAM532Bje5BPGq3P/lJqpQoUd7uwxw2yDKCagVXho6xTKKow2M9ImVU
        TqY+MXvKBYNc4eeFbtuLaWVRqXT7MvBF3SDpTJ+XnsWGwUc=
X-Google-Smtp-Source: ABdhPJzOX+i5BwU3Z2J5JH0eSZGuLpd1CzOeiVLEHnvazKFD2q1AIDuQGmPOlKxVKP4eKJDtb6uGQSoEP0XgEByktWw=
X-Received: by 2002:a2e:730b:: with SMTP id o11mr869966ljc.176.1630708534646;
 Fri, 03 Sep 2021 15:35:34 -0700 (PDT)
MIME-Version: 1.0
From:   Shantur Rathore <shantur.rathore@gmail.com>
Date:   Fri, 3 Sep 2021 23:35:23 +0100
Message-ID: <CAHc5_t3GuBPxQRkrxh3QnZ0V+eMFz+C=oe-hHdpTNHyx-SE2tQ@mail.gmail.com>
Subject: [PATCH 1/1] usb: dwc3: fix endpoint direction when inputs are more
 than outputs
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In RK3399 as per documentation (
https://usermanual.wiki/Document/RockchipDeveloperGuidelinux44USB.31610806
), there are 7 Input Endpoints and 6 Output endpoints, in total 13
endpoints.

Currently dwc3/gadget.c driver uses the number of endpoints
available and starts setting them up with even endpoints as output
endpoints and odd numbered as even endpoints. This leads to 7 Output
endpoints and 6 input endpoints for RK3399.

If you try to create a composite gadget which uses all the input
endpoints, one can see the issue. You just need to create functions to
use up the last input ep and it would fail to create. No need to
connect it to the host.
This was confirmed when running a rockchip-linux bsp image.

[root@rockpro rock]# ls /sys/kernel/debug/usb/fe800000.usb/
ep0in  ep0out  ep1in  ep1out  ep2in  ep2out  ep3in  ep3out  ep4in
ep4out  ep5in  ep5out  ep6in  link_state  lsp_dump  mode  regdump
testmode

Currently in linux mainline it is

[root@rockpro rock]# ls /sys/kernel/debug/usb/fe800000.usb/
ep0in  ep0out  ep1in  ep1out  ep2in  ep2out  ep3in  ep3out  ep4in
ep4out  ep5in  ep5out  ep6out  link_state  lsp_dump  mode  regdump
testmode

ep6 being out instead of in as per the hardware spec.

Upon investigation of rockchip bsp kernel,
https://github.com/rockchip-linux/kernel/

The issue was clear, currently, dwc3/gadget driver doesn't take
DWC3_NUM_IN_EPS into consideration while enumerating them.

The patch below fixes the issue and ep6 is correctly enumerated as input.

Signed-off-by: Shantur Rathore <i@shantur.com>
---
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 01866dcb953b..279c9a97cb8c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -555,6 +555,7 @@ static void dwc3_core_num_eps(struct dwc3 *dwc)
  struct dwc3_hwparams *parms = &dwc->hwparams;

  dwc->num_eps = DWC3_NUM_EPS(parms);
+ dwc->num_in_eps = DWC3_NUM_IN_EPS(parms);
 }

 static void dwc3_cache_hwparams(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 5612bfdf37da..89a0998c618c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1227,6 +1227,7 @@ struct dwc3 {
  u8 speed;

  u8 num_eps;
+ u8 num_in_eps;

  struct dwc3_hwparams hwparams;
  struct debugfs_regset32 *regset;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 804b50548163..d9d19dc0a29f 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -693,9 +693,11 @@ void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)

  dwc->last_fifo_depth = fifo_depth;
  /* Clear existing TXFIFO for all IN eps except ep0 */
- for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
-      num += 2) {
+ for (num = 3; num < DWC3_ENDPOINTS_NUM; num += 2) {
  dep = dwc->eps[num];
+
+ if(!dep)
+ continue;
  /* Don't change TXFRAMNUM on usb31 version */
  size = DWC3_IP_IS(DWC3) ? 0 :
  dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
@@ -2257,7 +2259,7 @@ static void dwc3_stop_active_transfers(struct dwc3 *dwc)
 {
  u32 epnum;

- for (epnum = 2; epnum < dwc->num_eps; epnum++) {
+ for (epnum = 2; epnum < DWC3_ENDPOINTS_NUM; epnum++) {
  struct dwc3_ep *dep;

  dep = dwc->eps[epnum];
@@ -2960,10 +2962,9 @@ static int dwc3_gadget_init_out_endpoint(struct
dwc3_ep *dep)
  return dwc3_alloc_trb_pool(dep);
 }

-static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
+static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum, bool
direction)
 {
  struct dwc3_ep *dep;
- bool direction = epnum & 1;
  int ret;
  u8 num = epnum >> 1;

@@ -3011,21 +3012,30 @@ static int dwc3_gadget_init_endpoint(struct
dwc3 *dwc, u8 epnum)
  return 0;
 }

-static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total)
+static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total, u8
num_in_eps)
 {
- u8 epnum;
+ u8 num;
+ int ret;

  INIT_LIST_HEAD(&dwc->gadget->ep_list);

- for (epnum = 0; epnum < total; epnum++) {
- int ret;
+ /* init input endpoints as reported by hw */
+        for (num = 0; num < num_in_eps; num++) {

- ret = dwc3_gadget_init_endpoint(dwc, epnum);
- if (ret)
- return ret;
- }
+                ret = dwc3_gadget_init_endpoint(dwc, (num << 1) + 1, 1);
+                if (ret)
+                        return ret;
+        }

- return 0;
+        /* init rest endpoints as output endpoints */
+        for (num = 0; num < total - num_in_eps; num++) {
+
+                ret = dwc3_gadget_init_endpoint(dwc, num << 1, 0);
+                if (ret)
+                        return ret;
+        }
+
+ return ret;
 }

 static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
@@ -4282,7 +4292,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
  * sure we're starting from a well known location.
  */

- ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps);
+ ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps, dwc->num_in_eps);
  if (ret)
  goto err4;

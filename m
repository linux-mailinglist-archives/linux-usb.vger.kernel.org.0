Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DDE6E9A45
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 19:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjDTRFq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 13:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjDTRFp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 13:05:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2552423F
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 10:05:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9BEB9DE;
        Thu, 20 Apr 2023 19:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682010326;
        bh=EMeKyB0CDnNjypp8o2nu4itxvbW+GuvPobxSeEdrewM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bZeWqswz/Rj7FKB/PzGBKwv9g83GZOTIFnPtShdjfPuLWwSp8D+mpbqWFnNE0dtQY
         UMZeX2Oiei6q8U+3XeXU9IsxZE7es9LrK3+qSrj1JbxKDDzs8Izx1E+gfqw/HnPkk3
         xXjTPLRi0ezbxTAjQinBcTbwC6V95lQqtA2AObm0=
Date:   Thu, 20 Apr 2023 20:05:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Avichal Rakesh <arakesh@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Message-ID: <20230420170546.GE21943@pendragon.ideasonboard.com>
References: <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
 <857134d6-1537-4879-9c1e-b7067d0fdeb3@rowland.harvard.edu>
 <20230420023123.hkde4t2ayrrri2lb@synopsys.com>
 <8c0da0fc-ac5d-42f4-9071-14fb78539f65@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c0da0fc-ac5d-42f4-9071-14fb78539f65@rowland.harvard.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 20, 2023 at 10:31:24AM -0400, Alan Stern wrote:
> On Thu, Apr 20, 2023 at 02:31:25AM +0000, Thinh Nguyen wrote:
> > On Wed, Apr 19, 2023, Alan Stern wrote:
> > > On Wed, Apr 19, 2023 at 09:49:35PM +0000, Thinh Nguyen wrote:
> > > > By the usb spec, for IN direction, if there's no data available and the
> > > > host requests for data, then the device will send a zero-length data
> > > > packet.
> > > 
> > > I'm not aware of any such requirement in the USB-2 spec.  The closest I 
> > > can find is in section 5.6.4:
> > > 
> > > 	An isochronous IN endpoint must return a zero-length packet 
> > > 	whenever data is requested at a faster interval than the 
> > > 	specified interval and data is not available.
> > > 
> > > But this specifically refers only to situations where the host asks for 
> > > isochonous data more frequently than the endpoint descriptor's bInterval 
> > > describes.
> > 
> > This is from usb 3.2 section 4.4.8.2:
> > 
> > 	Note, if an endpoint has no isochronous data to transmit when
> > 	accessed by the host, it shall send a zero length packet in
> > 	response to the request for data.
> 
> Ah, but chapter 4 in the USB-3.2 spec describes only the SuperSpeed bus, 
> as mentioned in the first paragraph of section 4.1.  So the constraint 
> about sending 0-length isochronous packets when no data is available 
> applies only to SuperSpeed connections.  If a gadget is connected at 
> USB-2 speed, the constraint doesn't apply.
> 
> (And in fact, no matter what the connection speed is, there's always a 
> possibility that the first packet sent by the host to begin an 
> isochronous transfer might get lost or corrupted, in which case the 
> device would not send a reply in any case.)
> 
> > > >  This is what the dwc3 controller will do. So regardless whether
> > > > you prepare and queue a 0-length request or not, the host will receive
> > > > it.
> > > 
> > > Even so, whether the function driver submits these 0-length isochronous 
> > > requests makes a difference in terms of filling the slots in the 
> > > schedule and preventing later requests from becoming stale.
> > 
> > That's not my point. Avi concern was how the host may interpret 0-length
> > packet. My point was to note that it should behave the same as before.
> > Because even without sending 0-length requests, the controller would
> > already respond with 0-length packet already.
> 
> It would be good to confirm the reasoning by checking the source code 
> for the UVC host driver.  But I expect you are right.

The uvcvideo host driver should be fine. An isochronous frame descriptor
with actual_length set to 0 will cause the packet to be ignored. The
uvc_video_decode_isoc() function loops over all packets, and calls
uvc_video_decode_start() which starts with

	if (len < 2 || data[0] < 2 || data[0] > len) {
		stream->stats.frame.nb_invalid++;
		return -EINVAL;
	}

The -EINVAL return value causes the caller to ignore the packet.

We probably want to avoid increasing the counter of invalid packets
though, but the counter is used for debug purpose only, so it doesn't
affect operation negatively.

> > In fact, that's what the UVC driver should be doing, by maintaining the
> > request queue with dummy requests as suggested in the beginning.
> > 
> > Perhaps there was some misunderstanding. Sending 0-length request you
> > suggested is a perfectly good suggestion and UVC gadget driver should do
> > that instead of relying on the workaround in the dwc3 driver.
> 
> Agreed.

-- 
Regards,

Laurent Pinchart

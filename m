Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368356494EA
	for <lists+linux-usb@lfdr.de>; Sun, 11 Dec 2022 16:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbiLKPgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Dec 2022 10:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiLKPgn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Dec 2022 10:36:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8976AA1BE
        for <linux-usb@vger.kernel.org>; Sun, 11 Dec 2022 07:36:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 202EB60DF2
        for <linux-usb@vger.kernel.org>; Sun, 11 Dec 2022 15:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2769C433EF;
        Sun, 11 Dec 2022 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670773001;
        bh=24f+2W3TfpcrMCwXwDsDQ9xYkjU05vbMAvTJ74MxWFo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QRdMGtiIE7vZMwQh+s+tNIsO1r91hBv0GdMr94O3uIJUM1nC/62+IIoF6rMrnS7+s
         Y+1PZkthkugk7f1onC99jpaWj2sW4iQIVCLzGTdgcAAjsJ6QoJGuj3qRE0TdqH+zpu
         CnrawaRhShOKyCtC0LzJVBkJZ+LchBfvOk5FI6vJ997wqxssptKapxCMh03D5E7C1I
         rUFq2K41JLzI5k2rLQv7q4TuwPEqdBwVuaLbhmjy8ENedRlOXPMhz1+MxB5x+g8te6
         9gvO4JQQmLSDTj4bn8UOMU/MENp4xfKZ87zjtOSpMPDYgo2I4XqrmMQQSXcS3kgKMx
         tORDzLEbtXUEQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: dwc3 38100000.usb: No resource for ep1in
In-Reply-To: <f7196abb-d92e-ab47-6c7e-bea686f402c4@ideasonboard.com>
References: <1c187708-be86-0391-6cbd-3466cf0478fe@ideasonboard.com>
 <87a63ymnlw.fsf@balbi.sh>
 <f7196abb-d92e-ab47-6c7e-bea686f402c4@ideasonboard.com>
Date:   Sun, 11 Dec 2022 17:36:36 +0200
Message-ID: <87edt63qbf.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Dan Scally <dan.scally@ideasonboard.com> writes:
> Good morning
>
> On 08/12/2022 06:11, Felipe Balbi wrote:
>> Hi,
>>
>> Dan Scally <dan.scally@ideasonboard.com> writes:
>>> I'm having an issue with DWC3 which I'm hoping you might be able to shed
>>> light on. I'm using the UVC gadget function to stream video from an
>>> imx8mp platform, which works just fine. Once I have stopped streaming
>>> however and after some time has passed (the exact duration seems to vary
>>> quite a lot from 1-2 minutes to 15+ mins) I get a kernel warning like so:
>> As Greg mentioned, please add Thinh, the new maintainer, to the loop.
>
>
> Apologies to both of you; for some reason I thought you had taken over 
> from Thinh rather than the other way around. Thanks for the heads up Greg.

no worries, it happens.

>> [1] https://kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs
>
>
> Both the trace and regdump should be in the attached .tar.gz

Can you confirm which kernel version you're using?

It looks like there's a missing End Transfer on ep1in:

>   uvc-gadget-696 [000] .....  2646.761444: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
> irq/208-dwc3-689 [000] D..3.  2647.237436: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020086 06070200 00000000 --> status: Successful
> irq/208-dwc3-689 [000] D..3.  2647.237457: dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [406] params 00000000 45751000 00000000 --> status: Successful
> irq/208-dwc3-689 [000] D..3.  2647.237467: dwc3_gadget_ep_enable: ep1in: mps 16/1024 streams 16 burst 0 ring 0/0 flags E:swBp:<
>   uvc-gadget-696 [003] d..1.  2648.484042: dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [30c08] params 00000000 00000000 00000000 --> status: Successful
>   uvc-gadget-696 [003] d..3.  2648.490356: dwc3_gadget_ep_disable: ep1in: mps 16/1024 streams 16 burst 0 ring 0/0 flags E:swbp:<
>   uvc-gadget-698 [001] .....  2650.645667: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
> irq/208-dwc3-689 [000] D..3.  2651.141040: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020086 06070200 00000000 --> status: Successful
> irq/208-dwc3-689 [000] D..3.  2651.141061: dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [406] params 00000000 45751000 00000000 --> status: Successful
> irq/208-dwc3-689 [000] D..3.  2651.141070: dwc3_gadget_ep_enable: ep1in: mps 16/1024 streams 16 burst 0 ring 0/0 flags E:swBp:<
> irq/208-dwc3-689 [000] D..3.  3201.415410: dwc3_gadget_ep_disable: ep1in: mps 16/1024 streams 16 burst 0 ring 0/0 flags E:swBp:<

Right here we don't know if DWC3_EP_DELAY_STOP flag is set. In fact,
there are many flags which are not decoded to the trace points, which
makes this trace point "pointless" as it's not helping with debug
activities anymore.

In any case, I suspect DELAY_STOP is set at this point, which is causing
dwc3_stop_active_transfer() to bail out without issuing the End Transfer
command, see lines 3725 - 3728 in gadget.c (quoted below):

	if (!(dep->flags & DWC3_EP_TRANSFER_STARTED) ||
	    (dep->flags & DWC3_EP_DELAY_STOP) ||
	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
		return;

This, in turn, will cause a subsequent ep_enable to fail with No
Resource, as the resource is still occupied by the same endpoint due to
lack of End Transfer.

@Thinh, looks like something you should patch up. Also, you should
probably go through the trace points and make sure all relevant
information is being printed to trace points. We don't want to have to
guess what's going on :-)

> irq/208-dwc3-689 [000] D..3.  3201.584476: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020086 06070200 00000000 --> status: Successful
> irq/208-dwc3-689 [000] D..3.  3201.584506: dwc3_send_gadget_ep_cmd: No resource for ep1in
> irq/208-dwc3-689 [000] D..3.  3201.814837: dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [406] params 00000000 45751000 00000000 --> status: No Resource

-- 
balbi

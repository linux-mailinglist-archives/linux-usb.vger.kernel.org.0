Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB01B67F1E4
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jan 2023 00:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbjA0XAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 18:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjA0XAy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 18:00:54 -0500
X-Greylist: delayed 777 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Jan 2023 15:00:52 PST
Received: from mx0a-00445d01.pphosted.com (mx0a-00445d01.pphosted.com [205.220.171.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE763118
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 15:00:52 -0800 (PST)
Received: from pps.filterd (m0303598.ppops.net [127.0.0.1])
        by mx0a-00445d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30RCapZM014284
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 17:47:55 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by mx0a-00445d01.pphosted.com (PPS) with ESMTPS id 3n917wbmcs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 17:47:54 -0500
Received: by mail-io1-f70.google.com with SMTP id i8-20020a6b7908000000b007132e024fb5so1203092iop.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 14:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bostondynamics.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ok/U3nL61zcbuVKvbVAieq4To5wohvDujyaHN4IorHc=;
        b=nyAh8+5fwjWD1uGJU4ly4l/a7iQ45UCM3Kuhb5nmufXF3vgEdVPCk5+WvHo2DS2KcI
         s5XlHV7GBhywrzW1eiouO4v1ZJrfz55zkWXMM4UxxUQHQfBiJuDJQANpAouoY/plYvkE
         DI/8+zF8/O6d7RH10J0onZilc9raQjUBONF+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ok/U3nL61zcbuVKvbVAieq4To5wohvDujyaHN4IorHc=;
        b=OsEvQJPkgZyeubSAW9/nVzYsmvktU0PGtENrEo1aJ/V45ZssharDaukp/FEv9ME13E
         dQzjAYdoh9lexdglGKWtSay7EdJ2qMZrCWM8yIkPreyGV3LGISPxxkaQC62lBYqB2WEU
         IomQI7tMvUpsnkDwU5gLtJYJt/Nrohe9R5aqZnlR1ygaA9MBIMEJAJKisfT3XkwEybig
         A9NqwvBW6ygVmp6OIRJCIOO+AJGlZ1Zo3KX19/lr0DpipLpfxsaBEAAwKqbnI5bzKDHE
         KkEgW7yKUwwX6RORjOyDRJ/uXpVhCYNTS+C3tEl9TU+ut54XrxUk4cbFOMktJ6g/HN3R
         xdig==
X-Gm-Message-State: AFqh2kqkr+gkrbB4FWzVivoURYbKRVATwL20lf2pTPx/RbGQEq4677Yq
        2efzalLAFmrGZlpEFj7BkK/eCCUfqxDIpLQOmFpkgI4c8vCyfcDx1c1hFMgNqR470nvEpzixM50
        hs90lsaNC12Pm3Dp0pK+TjkiDmeMFytJv7Tbo
X-Received: by 2002:a05:6638:2208:b0:38a:d3ad:34a2 with SMTP id l8-20020a056638220800b0038ad3ad34a2mr5545047jas.141.1674859673632;
        Fri, 27 Jan 2023 14:47:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZ/m0EUYQEQHmZbgkdBRurVJyC/8umkUNCN79f5qCOSI737uHmPkmoKg8/z2w6eagU62kYKsxak917E1zvZ6c=
X-Received: by 2002:a05:6638:2208:b0:38a:d3ad:34a2 with SMTP id
 l8-20020a056638220800b0038ad3ad34a2mr5545044jas.141.1674859673353; Fri, 27
 Jan 2023 14:47:53 -0800 (PST)
MIME-Version: 1.0
References: <CAHPEz-1J=PU1Qgyw9=gWbC_Z71muoXQx=jYCvB2XE=_qZySCqQ@mail.gmail.com>
 <54dca4fd-81c3-ba7f-e63e-64c8a38eebd8@linux.intel.com>
In-Reply-To: <54dca4fd-81c3-ba7f-e63e-64c8a38eebd8@linux.intel.com>
From:   Joe Bolling <jbolling@bostondynamics.com>
Date:   Fri, 27 Jan 2023 17:47:42 -0500
Message-ID: <CAHPEz-30ypzfmCp7kqszSOa=-wXqgE8ZeysejO_mebo4UonEGg@mail.gmail.com>
Subject: Re: PROBLEM: Error 110 from ASMedia Host Controller
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 5si7opMyRJ1Bge7BeWOd3bO9TQJSAeNU
X-Proofpoint-ORIG-GUID: 5si7opMyRJ1Bge7BeWOd3bO9TQJSAeNU
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Mathias!

I received an updated firmware image from ASMedia. It seems to improve
the 110 error problem a little bit - after the error occurs, I can
still run lsusb without it hanging. However, the streaming performance
of the camera has worsened with the new firmware; even with only one
camera connected, I get "ERROR Transfer event TRB DMA ptr not part of
current TD ep_index 8 comp_code 1" after just a few frames.

I guess the good news is these logs might be easier to analyze, since
there's only one endpoint needed to reproduce the error. I'm not sure
if this is the same behavior I was seeing before or not.
Trace: https://bostondynamics1.box.com/s/3ovxdzu8g276os0pur5rmqbj2vzsgk79
dmesg: https://bostondynamics1.box.com/s/7420hi96o5o0f8rmsc2vaafwxf8fcv9y

Thanks,
Joe

On Tue, Jan 24, 2023 at 9:39 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 21.12.2022 0.12, Joe Bolling wrote:
> > [1.] One line summary of the problem: Error 110 from ASMedia Host Controller
> >
> > [2.] Full description of the problem/report: I'm seeing a failure from
> > XHCI_HCD when I stream video from Intel Realsense D435 cameras through
> > an ASMedia ASM3042 USB host controller. The issue usually manifests as
> > repeated Error 110s from the camera as long as I'm trying to stream
> > data:
> > [  100.227800] usb 4-1: Failed to query (SET_CUR) UVC control 1 on
> > unit 3: -110 (exp. 1024).
> > Followed by a bit of a lockup from XHCI_HCD. lsusb will hang and I
> > can't get any image data from the camera. This problem seems to happen
> > sooner when there are multiple cameras connected and streaming. In the
> > logs below, I'm streaming from four cameras, two connected to an
> > ASM3042 and two via an Intel host controller. It seems to happen when
> > I stop and re-start streaming from the cameras repeatedly. dmesg and
> > tracing output are located in this folder:
> > https://urldefense.com/v3/__https://bostondynamics1.box.com/s/qtn28it8avda6pvve5sowyaeff4jzlyr__;!!ELB4yx2gjxJSXcA!d2lgaEeH3vMugmMBo7x76qFCmRgKvMM-J1eWH2PchmoYaoAkK49xeN8Kx7qhu002Ktq3_zKCXFqpi23GnkTqGwPJRB_Oe7BAQSg$
> >
>
> Had a quick look at the trace.
> The control transfer that times out is queued at:
>
> 95.030596: xhci_urb_enqueue: ep0out-control: urb 000000005be6faad pipe 2147484160 slot 1 length 0/1024 sgs 0/0 stream 0 flags 00110000
> 95.030597: xhci_queue_trb: CTRL: bRequestType 21 bRequest 01 wValue 0100 wIndex 0300 wLength 1024 length 8 TD size 0 intr
>
> It never completes so it's cancelled after 5 seconds.
> xhci driver stops the endpoint to remove the cancelled transfer.
>
> 100.268771: xhci_urb_dequeue: ep0out-control: urb 000000001ac66029 pipe 2147484160 slot 1 length 0/1024 sgs 0/0 stream 0 flags 00110000
> 100.268797: xhci_dbg_cancel_urb: Cancel URB 000000001ac66029, dev 1, ep 0x0, starting at offset 0x16f13f9c0
> 100.268804: xhci_queue_trb: CMD: Stop Ring Command: slot 1 sp 0 ep 1 flags c
>
> Trace is a bit hard to follow as we can't distinguish between hosts.
> Also seems that some events are just missing from trace.
>
> Control transfers on ep0 fails after this.
>
> No idea why this transfer does not complete, but I'd start by taking a better look at
> the 'Context state error' responses to stop endpoint commands.
>
> This error should mostly occur when a stop endpoint command races with an error on the endpoint,
> and in these cases the endpoint state should be "error" or "halted".
> In this trace endpoint state often stopped.
>
> 105.388818: xhci_queue_trb: CMD: Stop Ring Command: slot 1 sp 0 ep 1 flags c
> 105.389099: xhci_handle_event: EVENT: TRB 000000016f583260 status 'Context State Error' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
> 105.389101: xhci_handle_command: CMD: Stop Ring Command: slot 1 sp 0 ep 1 flags c
> 105.389104: xhci_handle_cmd_stop_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Ctrl burst 0 maxp 512 deq 000000016f13f9f1 avg trb len 0
>
> Many other control transfer requests in this log cause a protocol stall, meaning device
> doesn't support the request. xHC will halt the host side of an endpoint on both
> functional and protocol stalls, and needs to be recovered with a reset endpoint command.
>
> Maybe ASMedia host side endpoint is really halted even if it reports stopped, and needs a
> reset endpoint command to recover?
>
> Thanks
> Mathias
>


-- 
Joe Bolling (he/him)
Hardware Engineer
Boston Dynamics
jbolling@bostondynamics.com

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64FD4680F36
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 14:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbjA3Nm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 08:42:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbjA3Nm4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 08:42:56 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667C9468B
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 05:42:54 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D20A36602E28;
        Mon, 30 Jan 2023 13:42:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675086173;
        bh=wJXT2D+Mg/aJIqPHLYNtVivTcfcH1Oslk4YPOHBJ/V4=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=CP825TiJcBsORzIKzrmg5pSYg0yBJ2EU+rnMjJRLTo5s8UYl5Lr+shGO8fxjASmqm
         in3bsIPP7yRv4w6/b/DUVd1OPxw3eTEo0u/6qZI6w+U+w6Zu2n+J1RPU/oXg+cHduF
         WgR+m4zBIGTj+UdEiKPrmM2HI98XRtmWW/Spdtyhwy8y+A6jL0tNWZ6NAjQKR4Ag0f
         mJyxgzraz3eQdhJVABglvku0drm1AUp2NiQNIjaPX8Q+poIx8Jvp6KbBBaHnL/3XrA
         myl06tEFOAQE80rYXY0dj0mHDTzYQCspBOeNTp7X2mNMp4dDqEEBbY1d0RhNSOPjVl
         W69n4sUWFxJYg==
Message-ID: <979dcea0-938e-377b-c9a4-0a796bbdf7bc@collabora.com>
Date:   Mon, 30 Jan 2023 14:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: OS Descriptor version in FunctionFS
To:     Yuta Hayama <hayama@lineo.co.jp>, linux-usb@vger.kernel.org
References: <60cd04bb-c080-4242-b981-8da1e1c3ca53@lineo.co.jp>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <60cd04bb-c080-4242-b981-8da1e1c3ca53@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

W dniu 25.01.2023 o 09:23, Yuta Hayama pisze:
> Hi,
> 
> I have a question about MS OS descriptor support in FunctionFS.
> 
> I understand that the current FunctionFS supports OS descriptors and that the
> FunctionFS user mode driver can optionally be set up with a configuration that
> includes OS descriptors. Here, there are several versions of the OS descriptor,
> but the current FunctionFS (or gadget framework?) supports only v1.0, I think.
> Indeed, __ffs_do_os_desc_header() in drivers/usb/gadget/function/f_fs.c rejects
> OS descriptors other than v1.0 in the following way:
> 
> static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
> 				   struct usb_os_desc_header *desc)
> {
> 	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
> 	u16 w_index = le16_to_cpu(desc->wIndex);
> 
> 	if (bcd_version != 1) {
> 		pr_vdebug("unsupported os descriptors version: %d",
> 			  bcd_version);
> 		return -EINVAL;
> 	}
> 	
> 	/* ... */
> 
> Here's a question: isn't it wrong to assume that the value of desc->bcdVersion
> in OS descriptor v1.0 is 0x0001? From reference to the following document on
> OS descriptor v1.0, it looks like the value 0x0100 is assumed. (Well, I don't
> think v1.0 will be 0x0001 since it would be in BCD form as the name suggests.)
> 
> [Microsoft OS 1.0 Descriptors Specification]
> https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/microsoft-os-1-0-descriptors-specification
> 
> Page 6 of OS_Desc_CompatID.doc and page 5 of OS_Desc_Ext_Prop.doc explain the
> header section, which can be found there. The examples of descriptors also show
> bcdVersion=0x0100.
> 
> Would the fix be something like the following?
> 
> 	if (bcd_version == 0x0001) {
> 		pr_debug(" ... ");
> 		/*
> 		 * Pass through for compatibility, but notify to fix the user
> 		 * mode driver?
> 		 */
> 	} else if (bcd_version != 0x0100) {
> 		pr_vdebug("unsupported os descriptors version: %d",
> 				  bcd_version);
> 			return -EINVAL;
> 	}
> 
> By the way, with the current FunctionFS code, we have to set bcd_version=0x0001
> in the OS descriptor, but it looks like the Windows host(USB host) won't
> complain about that.

Are you able to check what does Windows host actually see in bcd_version if
it is set as "0x0001" at the FunctionFS gadget side? And then, whether it does
not complain because it sees what it expects or because it does not care even
though it sees something it doesn't expect?

Regards,

Andrzej


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8731B9B34A
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 17:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405353AbfHWP2C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 11:28:02 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:18665 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405351AbfHWP2C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Aug 2019 11:28:02 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id B1069202D0;
        Fri, 23 Aug 2019 17:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1566574076; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i3cEHWHV9INLKxovFOfy8b4lks5tBLwox2om3x6UsI4=;
        b=tlnMpL3aXRfxaIlIDoyYYcE9DRyv95U3hLK86oSvgvC524oMSFHjPpcZEczIZk/zFd140h
        4h+k1N81azMjsGxiMXOTamhJCzegZen8yVU0pgc5DJPTTbRAcDkEGGR8qP6wH7OC1Dv89x
        BSHWQx2ky1gbSoo8Z86LSMGLGYiC1+qv2s/yYHRPtV3WwQNPjvm5DnKEFEZd8L1vu5A+Rt
        NoXLRS9ldmnqEvfrP0JD+Cg72oHl00tukGguwwmJ7zgYGdd5V+xhphfzWxL+nGwXtkL85u
        FYCDDurWMNVzLbS85ESqMbMG8AkPmDXfS/s7yTaeuVq57tQNJpDS7f8u0JYq2Q==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 940E3BEEBD;
        Fri, 23 Aug 2019 17:27:56 +0200 (CEST)
Message-ID: <5D6005FC.1060002@bfs.de>
Date:   Fri, 23 Aug 2019 17:27:56 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: problems with Edgeport/416
References: <5D5D1C8C.9080000@bfs.de> <20190821112009.GA5228@kroah.com> <5D5D2F9E.7050805@bfs.de> <20190821122028.GA19107@kroah.com> <5D5D4170.4070001@bfs.de> <eb4392d938654d99a3f37820b279c839@SVR-IES-MBX-03.mgc.mentorg.com> <5D5D49DF.1040800@bfs.de> <631418d3c1814830820db0c66f82b17e@SVR-IES-MBX-03.mgc.mentorg.com> <5D5D51FF.5010400@bfs.de> <2ae1fb935c2041f8b0d54e311e730ba5@SVR-IES-MBX-03.mgc.mentorg.com>
In-Reply-To: <2ae1fb935c2041f8b0d54e311e730ba5@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_TWO(0.00)[2];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Am 21.08.2019 16:24, schrieb Schmid, Carsten:
>>
>> this should it be,
>>
> Suspicious: line 141 of the log:
> [765647.193393] usb 7-1.1.2: reset full-speed USB device number 15 using uhci_hcd
> 
> Can you please collect another log around reset, additionally enabling uhci dyndbg using
> echo -n 'module uhci_hcd =p' > /sys/kernel/debug/dynamic_debug/control
> 


Just to close the problem:
I have installed the  Edgeport/416 on a different pc

Linux  4.12.14-lp150.12.25-default #1 SMP Thu Nov 1 06:14:23 UTC 2018 (3fcf457) x86_64 x86_64 x86_64 GNU/Linux
With opensuse 15.0

the one with the problem was:
Linux  4.12.14-lp151.28.10-vanilla #1 SMP Sat Jul 13 17:59:31 UTC 2019 (0ab03b7) x86_64 x86_64 x86_64 GNU/Linux


the far the device works as expected (to my surprise). So it seems to be a broken USB, why it fails
with the edgeport but not with the pl2303 (usb->rs232 someone) i used for comparison; no idea.

sorry for the noise,

re,
 wh

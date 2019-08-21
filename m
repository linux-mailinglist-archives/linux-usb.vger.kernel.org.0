Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 682A897B26
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 15:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbfHUNk4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 09:40:56 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:55455 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfHUNk4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Aug 2019 09:40:56 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 20D7620316;
        Wed, 21 Aug 2019 15:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1566394848; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qw45UCY6MRJ3PBwVDIPBcWnn7+MeO2Ms9ohIRMslBzk=;
        b=qSgHzCGFyWhNpCiXbOGSVj51+syaIKn963Fm/MZI42G1V5QGeLWzraXSVi/lcTUpvj75Vr
        CUAUlc72AqQPqwfS8mW7U4mR7+q5UqxfC8NjSkmIbwlzPO2bcGRyYUzmx97zhiZiQ1QMm+
        Tsm3xUqvgplfE4lR8ZvsWauAPzqYUY4xodVJxtKAKwUV4jVaEIyvPdHYUjLwceEjthjoMy
        MMgoUkrrOG5NmS3AV7FCzDWlNC8RaHMi9tqMAoe16oMWg8qXYJ3ZmKhNPuXj5wMhQC1+RS
        6oRSQ5eZn/FIaC92nKkSKhvbYIXzzD9ZQuZiev29iONuCULaNmzEl8JrO1kOBw==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id F1E87BEEBD;
        Wed, 21 Aug 2019 15:40:47 +0200 (CEST)
Message-ID: <5D5D49DF.1040800@bfs.de>
Date:   Wed, 21 Aug 2019 15:40:47 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: problems with Edgeport/416
References: <5D5D1C8C.9080000@bfs.de> <20190821112009.GA5228@kroah.com> <5D5D2F9E.7050805@bfs.de> <20190821122028.GA19107@kroah.com> <5D5D4170.4070001@bfs.de> <eb4392d938654d99a3f37820b279c839@SVR-IES-MBX-03.mgc.mentorg.com>
In-Reply-To: <eb4392d938654d99a3f37820b279c839@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: multipart/mixed;
 boundary="------------000200040902010704070401"
X-Spam-Status: No, score=-2.92
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-2.92 / 7.00];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         TO_DN_SOME(0.00)[];
         HAS_ATTACHMENT(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+,1:+];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.82)[99.21%];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[multipart/mixed,text/plain];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.998,0];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------000200040902010704070401
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Am 21.08.2019 15:20, schrieb Schmid, Carsten:
>>
>> Different computer but same cables i guess the device is ok.
>>
> But maybe the USB  port of the computer is broken.
> 
>> NTL I found that little gem:
>> https://www.fclose.com/linux-kernels/594677/usb-io_ti-add-heartbeat-to-
>> keep-idle-ep-416-ports-from-disconnecting-linux-4-3/
>>
>> The behavior would fit (any way to check that the heartbeat is active ?).
>>
> Which kernel are you running on?
> use "uname -a" to get it.
> This patch was introduced in 4.3 kernel, not really hot ...
> And, yes, looks like what you experience.
> 

mea culpa, i had a typo in the first msg to greg so you did not see my first post:

I tested with: Opensuse 15.1 on a DELL latitude E5400

 uname -a
 Linux omnfrmo10 4.12.14-lp151.28.10-vanilla #1 SMP Sat Jul 13 17:59:31 UTC 2019 (0ab03b7) x86_64 x86_64 x86_64 GNU/Linux

 I did some experiments (changing cables etc) but always the same. But
 when tested with a windows system it worked all fine.  later i used a
 single port USB->Serial and all worked as expected.



>> Casten Schmidt ask me to look into
>> /sys/kernel/debug/dynamic_debug/control before i start to
>> debug the whole usb part, is that below expected behavior ? (i tried to find
>> what version of edgeport the driver suspects).
>>
>> drivers/usb/serial/io_ti.c:1507 [io_ti]do_boot_mode =_ "%s - STAYING IN BOOT MODE\012"
> ...
>> drivers/usb/serial/io_ti.c:884 [io_ti]i2c_type_bootmode =_ "%s - read 2 status error = %d\012"
>>
> That says that we have dynamic debug messages available for the driver.
> If you enable those by doing
> echo -n 'module io_ti =p' > /sys/kernel/debug/dynamic_debug/control
> 
> Then you should see at least some of those messages appear in dmesg (kernel log).
> 

i see a lot, see attached file


--------------000200040902010704070401
Content-Type: application/x-gzip;
 name="edge.log.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="edge.log.gz"

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
aAIA
--------------000200040902010704070401--

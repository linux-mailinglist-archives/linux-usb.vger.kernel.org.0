Return-Path: <linux-usb+bounces-4272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB18815608
	for <lists+linux-usb@lfdr.de>; Sat, 16 Dec 2023 02:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09202B243CB
	for <lists+linux-usb@lfdr.de>; Sat, 16 Dec 2023 01:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0303110E;
	Sat, 16 Dec 2023 01:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3DnECM6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0184A10F1
	for <linux-usb@vger.kernel.org>; Sat, 16 Dec 2023 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7b714a7835cso17911439f.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 17:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702690852; x=1703295652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/2ad2ksomZF3Qb5zNAiPea8SuCVQQoQ10H+9OH6oc0=;
        b=i3DnECM6CLFT2xhf1KJ5Xnmp2ZNLUdqBiMGlxsnCO+2C84KEPmVaEsOC1TDWn+h3Xq
         2sVh34iApic7IZNpT1dQBj6Sw7RlDqrzau6fh1M6eIc2H5Xd8d39JwoYc/LHte4QJGhf
         /rJt4HGAM01T//0KrJurAgSFW4z9dWupNwu6CcTQYhcM4NHLpzLmnGmILVlkVPafseyo
         IhsSPs2TQ2mLryIVLPwoj0cBfkn4mz5u6nwXfXxLhLwMYcqG1jGhm0WtTOY+Mh9Gfpc7
         XB4JEk1FsKoI7bb0hE4HAHRdyYkoV5jkDpXsVs5mLl/IneisGTRLX6D8nWPF4hPklFUe
         0Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702690852; x=1703295652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/2ad2ksomZF3Qb5zNAiPea8SuCVQQoQ10H+9OH6oc0=;
        b=iw5ewnPmqrIKNTpX25vWrZ5/m5WRNoMa3zWs+qyNaTOZL/7ypXSybRAswtw1uV81Ba
         aO31AFhgjt7Hi+pox51JP+PAJ4SuqgdUM1/bVy4+5ABuzQwp3C9TE5kBQTYXcngfu+U4
         75gb/SdrPla573N8qrwAiN/wV23FLam6EaW5AC3q1hrjel+TDkgW7Uw3+85VeN0xEEw1
         IevrhDXDu4cRA6D/uIL7ga+8ZyXiZpHBLCnuB6dIkdqlaVJh+JpCBGw6xuY55y7IpbMj
         845nsZb3cb/wJeOge8VpghMl8JwuR1y64204b/ch1IS63bKk8xtu/tQDe4IefR6kmRFN
         Tr8w==
X-Gm-Message-State: AOJu0Yyiu9Uri5qynlgBvWvJqlpZdRi3A60dbPRJEqe7iMbJBqDpfV/m
	6opBSY3PJpTIp3AjvKJLFaB8R2S4VCw=
X-Google-Smtp-Source: AGHT+IGRipwSq0c/HUaYBcevLzANssDwsJcBhPBoJPbluxVsqUDiNNpOpHbZ/tcg2a5DxV1lN8ycjg==
X-Received: by 2002:a05:6602:2d95:b0:7b7:17c0:e19e with SMTP id k21-20020a0566022d9500b007b717c0e19emr24336280iow.0.1702690852090;
        Fri, 15 Dec 2023 17:40:52 -0800 (PST)
Received: from ?IPV6:2601:281:d47f:ffab:29be:a412:69e:e721? ([2601:281:d47f:ffab:29be:a412:69e:e721])
        by smtp.gmail.com with ESMTPSA id x10-20020a02970a000000b00468ea2264e1sm4192054jai.73.2023.12.15.17.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 17:40:51 -0800 (PST)
Message-ID: <fb11e93d-44d7-435d-b5cf-d358a8239304@gmail.com>
Date: Fri, 15 Dec 2023 18:40:50 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Enable modem line status events on cp210x, add
 support for PPS on RI pin
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, Brian Kloppenborg <brian@kloppenborg.net>
References: <20231009023425.366783-1-brian@kloppenborg.net>
 <ZXxOZ4xTKeA7_X3b@hovoldconsulting.com>
From: Brian Kloppenborg <bkloppenborg@gmail.com>
In-Reply-To: <ZXxOZ4xTKeA7_X3b@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Johan,

Thank you for returning to this topic. I apologize about not following 
through on Greg's comments. Life simply got in the way.

I understand your concerns regarding this patch. The performance 
implications are clearly undesirable as are triggering open and hang-up 
operations on the CD line as a result of signals on the RI pin.

Before I abandon this patch entirely, I am curious, is there any way we 
could enable the proposed behavior conditionally? For example, is there 
a way to pass a parameter to a driver much like one does a program?

I ask because the timing accuracy of this device is much better than I 
anticipated. Despite the jitter introduced by USB polling, chrony is 
able to work out the correct time to better than 10 microseconds. This 
is to be contrasted with 200-1000 microseconds to typical internet-based 
NTP servers. While this is certainly much worse than PPS over a true 
serial port, it might be a reasonable performance compromise for 
machines without a real serial port.

Please let me know your thoughts on this.

Thank you,

Brian


On 12/15/23 06:02, Johan Hovold wrote:
> Hi Brian,
>
> and sorry about the late reply. I was also waiting to see if you'd
> address the issues pointed out by Greg.
>
> On Sun, Oct 08, 2023 at 08:34:23PM -0600, Brian Kloppenborg wrote:
>
>> This is my first patch to the Linux kernel.
> There are some form issues as Greg's bot mentioned, like there being no
> commit message, missing Subject prefix, missing Signed-off by, and
> some coding style issues (space after if keyword, brackets around single
> line statements, etc).
>
> Make sure you have read
>
> 	Documentation/process/submitting-patches.rst
>
> and you should run scripts/checkpatch.pl on your patches before posting
> as it would find some of these issues.
>
> Just looking at the git log for this driver may also give you an idea of
> the expected patch format.
>
>> Patch 1 enables support for modem line status changes to the cp210x
>> driver. This is required to receive pulse-per-second (PPS) signals
>> from GPS receivers. Support for this feature exists in the FTDI
>> driver, but is not present in cp210x. The patch is implemented through
>> (1) enabling the device's event mode by default when the port is
>> opened or closed, and (2) registering the CTS, DSR, RI, and DCD
>> changes with the kernel through conventional means.
> So there are a few issues with this.
>
> First, as I mentioned in the commit message when adding support for the
> event mode, on at least some of the cp210x devices modem events appeared
> to be buffered until the next character was received:
>
> 	https://lore.kernel.org/r/all/20200713105517.27796-3-johan@kernel.org/
>
> Second, the event mode comes at a cost since all received characters
> needs to be processed one-by-one instead of simply being copied to the
> tty buffers.
>
> For those reasons, I left modem-event support unimplemented and only
> enabled event-mode when the user specifically requested input-parity
> checking.
>
> Perhaps some of these issues only affect some device types, and perhaps
> we can allow users to avoid the processing cost by only enabling event
> mode when, for example, CLOCAL is not set.
>
> Hmm, scratch that last bit, usb_serial_handle_dcd_change() would hang up
> the port when the CD is deasserted with !CLOCAL.
>
>> Patch 2 enables support for GPS PPS signals on the RI pin. While most
>> GPS devices typically expose this signal on the DCD pin, the Adafruit
>> Ultimate GPS with USB-C placed it on the RI pin instead. So this patch
>> is highly focused on that specific device. From what I can tell, the
>> usb_serial_handle_dcd_change function is used exclusively to register
>> PPS signals with the kernel, so calling it from the RI block shouldn't
>> result in unexpected behavior.
> So I'm afraid this is not going to work. First of all, serial drivers
> need to work with all types of devices and can't have hacks for quirky
> connected hardware like this.
>
> Second, the usb_serial_handle_dcd_change() also handles waiting for a
> modem connection on open and hangups using the carrier-detect line,
> which would break if called on RI instead of CD events.
>
> You also generally should not be using a slow USB device for things like
> PPS as I imagine latency and jitter would make it practically useless.
>
> Johan


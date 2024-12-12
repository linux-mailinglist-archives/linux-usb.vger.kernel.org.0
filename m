Return-Path: <linux-usb+bounces-18443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F49EFF07
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 23:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D20C287CF7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 22:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0661DD0FF;
	Thu, 12 Dec 2024 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kfocus-org.20230601.gappssmtp.com header.i=@kfocus-org.20230601.gappssmtp.com header.b="hrEQr22r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E21DAC83
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734041583; cv=none; b=K5IMnwmQQJKkff9FUeoKhwCCPjPSMeRW/hYR4W38KycfE5yLZ1GiEnsH5lFyAYjaeMD0iTTgaGtOjZ67NRAqxMU2vv2BMvnBwcQgXZCyolQMr62fbRbWSyVK2Sv/A7wFFYC4cd1IBEbbrz1hFrJG9le3rQFnEcyxHHbRKNSRjFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734041583; c=relaxed/simple;
	bh=V8KV1I489rwctsrMjYJvIF2xZzKkyYVZiu30oSWORHs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6vy9DhuJR/UaM1LKG2BfNw2W4QxLnVi1JSipXMoegbIBwG/fmcklG8knWVwJduSvBDS0JP9p70iFh6itjWw6SEmSHt2w5x6FVHZnA2t+BRuaArTVughAl5zysARZo1+xVBVDzlBjPv3EZoRQbJ+/KnabT0wYniILJabnbLElV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kfocus.org; spf=pass smtp.mailfrom=kfocus.org; dkim=pass (2048-bit key) header.d=kfocus-org.20230601.gappssmtp.com header.i=@kfocus-org.20230601.gappssmtp.com header.b=hrEQr22r; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kfocus.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kfocus.org
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-3a7d7db4d89so3767415ab.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kfocus-org.20230601.gappssmtp.com; s=20230601; t=1734041581; x=1734646381; darn=vger.kernel.org;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXwiX7B1rtDxAC4C4GelAYTOc/t/olcEHXEG7RsFBHE=;
        b=hrEQr22rb81vamkDWY7b1wZk7j99DAsPfDkwmpXiiDBTirCG6OaKFLyP3UdaqrXoTS
         a70PFTNQlpG0SyOoLxq3tmPXcqDjdKfGk0yvrR6V5Mo/grcW58yeyQLi7NXe8o2BRR4y
         Xram56JtaGQNlBZDAexsdpwHPSzjG0QkjWGWAN0xjtAvPHAmWleNzku4AsmviSJZYRrs
         +POhVNsS4SFhdVnZDLT1VfTTULqTdsDUjC/o61DbrNL9eeUhGgAb6lDPiDKuYgsVhxFs
         iiYE/yc95mW7ci3Ol7fYP6quFyp/IAZJLtXd4bVYADA5msKqS6jH4u+aROh6BiI7jnE4
         dH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734041581; x=1734646381;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXwiX7B1rtDxAC4C4GelAYTOc/t/olcEHXEG7RsFBHE=;
        b=gC+0qnbPc4OP5iy/utbzHwOkMfj82e+H6EJXD/a7KTODU1hKGWEzCHvEQhnQQ5gFq2
         LFqNdyVXkCnOo7E0Y1ZlMHoIg0kii8yHG8IAhRSvH/Lbcn+xUi44p+KKzyHX3TxK2Ea/
         rsLN+MDRl/F/sUgIcJODJpwj2+CTvdAmPi1MMKvFMTkH+sbHw9QCbWcJrx+nd1+JfYOs
         BDHD3Vrd0tf0eYIJrIPHrEUMjeTk7MEIqDiHEDahpAhHCboTWYxOdFlzMZuaBZIEppbd
         fA2G4ZL4lkZBuUgN13DtUo6T1Ncd63LK3/NFgaCmNVQriHPNoVshhId9W9vRu4hWxWWq
         pSqg==
X-Forwarded-Encrypted: i=1; AJvYcCVNMYIfePuMu11+x1aVCFqvARY+N4wQM7rqWdwU+Le8Knu6qBD1SyoUng+YpAzZLC/AcJhlSuPnoFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGFj0Su64BO/Wa655OhZcnImWpX4+FOQagD/XXFyqQ7e7L96e
	VeG4NaMoNbaF3R/W0IgkJEapHBLqdMw6vfi3FePbL44lFyonrA5bdjRhw1GUGjc=
X-Gm-Gg: ASbGncsFpXkOd42tjGPX1ujTyMqX5v+CIy/pc/uCf/L4p2eTTHxxkPOjPF5GKVRUZ3d
	++mb3/bfyV5WAWn9g8oRsaB3YRPbrlZL0IqExeBp5ytuuvEv5bKRB8l+wxspSzO92WdezMIkEGj
	tf3ib1VlaaCP3WNNEItvxlhvc9qWFcCceZIhHK3zznGNAGTngew0Z47ycDD3Y/ikQV4bQv1EGvm
	1Yzoqozp9ejHrK84vg6IGqMgbCnfCPOIZj+fRObS5f3HOmVgOIb
X-Google-Smtp-Source: AGHT+IGoxEFu2Bl5hL/Ygg8q/Ek9BtTRKzgsb2rytHIyGnXuZf/fPxCEBPsQr3S+aXgyiso5aOaGeg==
X-Received: by 2002:a92:cda6:0:b0:3ab:a274:d68 with SMTP id e9e14a558f8ab-3aff50b359fmr4975875ab.8.1734041580994;
        Thu, 12 Dec 2024 14:13:00 -0800 (PST)
Received: from kf-ir16 ([2607:fb90:bf9f:94:861e:2c62:ec62:4e01])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2bb66b0d7sm2463836173.91.2024.12.12.14.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 14:13:00 -0800 (PST)
Date: Thu, 12 Dec 2024 16:12:57 -0600
From: Aaron Rainbolt <arainbolt@kfocus.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: YehezkelShB@gmail.com, michael.jamet@intel.com,
 andreas.noever@gmail.com, linux-usb@vger.kernel.org, mmikowski@kfocus.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: USB-C DisplayPort display failing to stay active with Intel
 Barlow Ridge USB4 controller, power-management related issue?
Message-ID: <20241212161257.4110bdff@kf-ir16>
In-Reply-To: <20241115132022.GC3187799@black.fi.intel.com>
References: <20241101181334.25724aff@kf-ir16>
	<20241104060159.GY275077@black.fi.intel.com>
	<20241105141627.5e5199b3@kf-ir16>
	<20241106060635.GJ275077@black.fi.intel.com>
	<20241106110134.1871a7f6@kf-ir16>
	<20241107094543.GL275077@black.fi.intel.com>
	<20241111082223.GP275077@black.fi.intel.com>
	<20241112164447.4d81dc3a@kfocus.org>
	<20241114115136.GB3187799@black.fi.intel.com>
	<20241114104125.00a02eb1@kf-ir16>
	<20241115132022.GC3187799@black.fi.intel.com>
Organization: Kubuntu Focus
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/1RxQgQkpr/ah+QoJ0j6rTqH"

--MP_/1RxQgQkpr/ah+QoJ0j6rTqH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, 15 Nov 2024 15:20:22 +0200
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> Hi,
> 
> On Thu, Nov 14, 2024 at 10:41:25AM -0600, Aaron Rainbolt wrote:
> > This is production hardware (specifically Clevo's X370SNW1-G and
> > X370SNV1-G laptops), available for purchase from Sager, XOTICPC,
> > Schenker, likely many other resellers, and our own website
> > at https://kfocus.org/spec/spec-m2.html (with a tool that allows users
> > to work around the bug). The firmware is baked into the hardware
> > provided to us by our ODM, and for the sake of stability we do not
> > modify any firmware on the machines with the exception of applying
> > BIOS updates provided to us directly by the ODM. They appear to get
> > their firmware directly from Clevo.  
> 
> Okay thanks.
> 
> > We have requested an updated BIOS from the ODM. If one is
> > available, we will upgrade and run the tests again.  
> 
> Yes, I hope you can get the firmwares. The one you have now is not
> "production quality" firmare so you should not really have that there
> in the first place and Clevo should definitely provide you an
> upgrade. Note this is separate from the BIOS. But your BIOS has issue
> too regarding the USB4 power contract that is required by Microsoft
> so I would expect that you should get that one upgraded too.
> 
> The patch I shared earlier should deal with all the other cases except
> that weird one where we do not seem to get unplugs (and the resource
> is available) which is not how the firmware is expected to work. I was
> planning to submit it upstream after some more validation on our end,
> probably afer v6.13-rc1 is released. I'll CC you.
> 
> If/when you get the new firmare I would definitely appreciate if your
> folks could give it a try.

Hi Mika:

Just to catch you up: 
We find the most recent patch from this thread to be a good improvement.

We tested it on our hardware with USB-C attached displays. In
particular, it allows us to enable displays that do not time out while
using with Thunderbolt. Without the patch, enabling the Thunderbolt
kernel module would disable all attached USB-C displays in 15 seconds.

The patch does not resolve the hot plugging issue on our hardware, but
we have a work-around for that (lspci -k or reloading the thunderbolt
module). We have not been able to acquire new firmware yet, so this is
likely the issue.

The test results are attached if you are interested.

Sincerely, Aaron

--MP_/1RxQgQkpr/ah+QoJ0j6rTqH
Content-Type: text/markdown
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=2024-12-12-tbt-patch-compare.md

## Key
- Display: A USB-C Attached monitor
- A: 6.8.0-45
- B: 6.11.5
- C: 6.11.5-patched
- D: TBT enabled (y/n)
- E: Desktop showed, but timed-out after 15s
- F: Displays do not return on replug
- G: Can be flakey; sometimes a replug or display wake is needed
- N: NO
- Y: YES
- x: Passed

## Test Results
| A | B | C | D | Test           |
| - | - | - | - | -------------- |
| x | x | x | n | Boot with no Displays w/o TBT (modprobe -r thunderbolt)|
| x | x | x | n | Attach         1st  Display   |
| x | x | x | n | Stays Resident 1st  Display   |
| x | x | x | n | Replug > 60s   1st  Display   |
| x | x | x | n | Attach         2nd  Display   |
| x | x | x | n | Replug > 60s   2nd  Display   |
| x | x | x | n | Replug > 60s   BOTH Displays  |
| x | x | x | n | Sleep-Resume   BOTH Displays  |
| x | x | x | n | Reboot with    BOTH Displays  | G

| A | B | C | D | Test           |
| - | - | - | - | -------------- |
| x | x | x | Y | Enable TBT (modprobe thunderbolt)    |
| E | E | x | Y | Stays Resident BOTH Displays  |
| . | . | x | Y | Replug < 15s   1st Display (2nd Remains) |
| . | . | x | Y | Replug > 60s   1st Display (2nd Remains) |
| . | . | F | Y | Replug > 60s Both Displays    |
| . | . | x | Y | Toggle TBT / lspci -k restores Displays |
| . | . | x | Y | Sleep-Resume   BOTH Displays  |


--MP_/1RxQgQkpr/ah+QoJ0j6rTqH--


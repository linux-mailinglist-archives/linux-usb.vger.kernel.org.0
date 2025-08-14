Return-Path: <linux-usb+bounces-26834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D4B25EE0
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 10:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251F35A0CFE
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 08:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCB82E7F25;
	Thu, 14 Aug 2025 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Frh8T90g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D4134A8
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160277; cv=none; b=eERJEQ2CjyMTbD2EbRDwHBcjqT0fxTJzvEih8C6BpzzyKVs4GqjPRL9Rcyg6F7kjBMpAAO0cOORYDRBUQ2Tzf8JgMUp/EViQYbkT0WzPFgR50PSBqmbskqW4ZhXeMyMyKjhXbg2/vldvSgmizxksP1Ig5wzj6IlRETsoinSx1NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160277; c=relaxed/simple;
	bh=frMj7kQA0Q4u4IWM0zNGBLX5jjyccw32/cuPDqBIXnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZEPVDx0p5OpKWND1Dk/Cvbm94pafFRDx0YPxalgGlSSbd3v3CQLr94E30KtxGiADiZdCIWrui36Pd10tsoyhZ+RKa5V1Ad6v8NoFlqJIeSz57igw6xLatUBeInCC3ENOeYZSG8M9JjF9Zz8YZywqaDl+zJdO6N2QE9m99zxNwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Frh8T90g; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 158913FCE9
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1755159710;
	bh=ZoCGIpGMqNOoAfbKbKnyTnvK4O2pEBUUyIoa72kX2nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Frh8T90gfBaR8uiqkFIl2a0MdvHMEJ2pXwWvw5TZ0+o86eDleEAng7jh7a0HD3SQR
	 0DG7PH7J3g3FYjUFVixhY/s2xOOlp4ZHW64y/XHV0e6X5x/Ywq3DLFaRj52aMy4FL7
	 vWqX1bHF4zrav2hevLdAJRW4QEV64H8lwLhRFB/yWrzNzjcLnFiRlfHrR68PUPVVTs
	 Vld5SnfoxuPyRDwW6RRcdyfDzgCavhgxuYcpEvMEdZ169pmsDbNwHihKn/jW42CCRM
	 5kHF4Fp5GjiOo7nIYODdFnQsrpLTiQIop2zDNlD+G021IzEnMr0/+NN2S4OlxqnlH4
	 R9xR1Uu1H0IcA==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b9dc553704so355288f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 01:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755159709; x=1755764509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoCGIpGMqNOoAfbKbKnyTnvK4O2pEBUUyIoa72kX2nE=;
        b=UaQjELkfhI+YZD0eC3/syVKKsS2ypYF813Ca0wl08QMowLys6UiNbY8ghjuaR/Frmk
         tebYhFlGpSQCr/msX8Wh5WCAq9BOIWj1S7QFO9AKerJGs3MAUDhLWs9zmb4P1TOwwLqU
         kV+7RU2biJSIOTGdXqWaVDGj9cZhJUnLZ6XHCkfx6iFjIgl8x105BrbdVMHM0wSJeJ94
         Orv+NFBNWgrFneoeF3NnDClkzQQRYb2z2lB6vquIeEcrdxxtPUe1xN2QsYkNy9BUn5P0
         JdEFkVJ7p8z/tZef7EJyTUS8NlWIYoy416PhHkbo+5WgdPp8zmUt7mR2F9KKfOT8FRre
         INHg==
X-Forwarded-Encrypted: i=1; AJvYcCVEJQ0w8xUc+BIofTtWY7jCz/Yb6cZir7zZMPYO62HnWRLLKPWrjh0kCdd7hwyy6ijb0bgb4y8Sb2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyvBREfATVRo62VoeKRS9EQ5KTtuC+ddZ+7n/maxK9u9Mm7D8e
	QREIstDDJSpPRaY9kD88xnh7vhHGcltKmVZNuBV6cXLyd4EcA8UIR4oii1nu6kSX9iSdaM1a9cB
	DuPYHT42/Ee+sMhB0H4iI7nocwwORFIsDnWd0d6p3BY1byGo0LhjMK28kk4MviwrbmMp9TRboYK
	5dqpbMsN5KnyCt8ihpUt4C4zZgxpjk1cm2M40RZ7RJRz2Q6CWaQRM2
X-Gm-Gg: ASbGnctOiNowktCrWByFULM89WQ39hqcjC1Q517EUFl1fXscqAB0m3iG5JKt1t0+bBc
	UKZS/nIV7YoR8zeJXTbjnRq5YW0VkKvjktiFjRFj4WoyrF1X2eg9iRwZqC91oP25rmyErHH963g
	SklborRvtbU+YVDmbTdxOxxA==
X-Received: by 2002:a05:6000:250e:b0:3b7:886b:fb8d with SMTP id ffacd0b85a97d-3b9edfc7cf9mr1783181f8f.31.1755159709561;
        Thu, 14 Aug 2025 01:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkURSb4+xJ1TZ3wnlf1nlWdnzPumRO8vEPFRnq18fw63dkzCoZ5rR31Xwzv8YTepelKyGXMd4lSin5uyD/g/U=
X-Received: by 2002:a05:6000:250e:b0:3b7:886b:fb8d with SMTP id
 ffacd0b85a97d-3b9edfc7cf9mr1783159f8f.31.1755159709172; Thu, 14 Aug 2025
 01:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMqyJG2QceTyAONn_5m956zF_rpHLpognYYWnivm7J+w6Cw=RQ@mail.gmail.com>
 <20250728063329.GR2824380@black.fi.intel.com> <20250808064313.GM476609@black.igk.intel.com>
 <CAMqyJG3b5KsBjF=wW_+pB6MaSO0PQmq-iiAJ9aONZ6mZ1UtUNA@mail.gmail.com>
In-Reply-To: <CAMqyJG3b5KsBjF=wW_+pB6MaSO0PQmq-iiAJ9aONZ6mZ1UtUNA@mail.gmail.com>
From: En-Wei WU <en-wei.wu@canonical.com>
Date: Thu, 14 Aug 2025 16:21:36 +0800
X-Gm-Features: Ac12FXxvVX0eUlD2C7WLeNJbcxQt64cpLnKcyjGFulqvlSW3qJk59K14yMQKbRU
Message-ID: <CAMqyJG1yK5B7w5Vp=LQNcWHDCdbWGiiuA0jru_U6zJ6WhUc5PQ@mail.gmail.com>
Subject: Re: Thunderbolt call trace occurs on hot-plug
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org, michael.jamet@intel.com, andreas.noever@gmail.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

I just ran a test using a different cable, and the issue remains.

One thing I've noticed is that no matter which cable and whether there
is a call trace on that hot-plug event, there is always the message:

thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot
unplug event on 0:1

On Mon, 11 Aug 2025 at 16:04, En-Wei WU <en-wei.wu@canonical.com> wrote:
>
> Hi Mika,
>
> Thanks for the update.
>
> I didn't deliberately unplug the cable while the "acking hot unplug
> event on 0:1" happened, suggesting that there might be an issue on our
> cable as you said.
>
> I'll perform other tests and get back to you.
>
> Thanks,
> En-Wei.
>
> On Fri, 8 Aug 2025 at 14:43, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 28, 2025 at 09:33:29AM +0300, Mika Westerberg wrote:
> > > Hi,
> > >
> > > On Fri, Jul 11, 2025 at 11:54:46AM +0800, En-Wei WU wrote:
> > > > Hi,
> > > >
> > > > I'm seeing an issue on a Dell Pro Max 16 with Intel Arrow Lake CPU --
> > > > Hot-plugging a thunderbolt 4 cable into a thunderbolt 4 port (backed
> > > > by Intel iGPU) and connecting it to a Dell U2725QE monitor triggers
> > > > the following call trace. The issue reproduces approximately 60% of
> > > > the time.
> > >
> > > Could you share the whole dmesg (that is not line wrapped)? With
> > > "thunderbolt.dyndbg=+p" in the kernel command line.
> > >
> > > And can you confirm I understand the steps?
> > >
> > > 1. Boot the system up, nothing connected.
> > > 2. Once booted up, connect Thunderbolt cable to Dell U2725QE monitor.
> > > 3. Verify that the monitor works (+ run lspci/lsusb)
> > >
> > > Expected output: The monitor and the integrated peripherals (PCIe, USB)
> > > work fine.
> > >
> > > Actual output: There is error in the log and PCIe peripherals on the
> > > monitor do not show up in lspci output.
> >
> > For some reason I never got the reply from you although I can see it on
> > lore.kernel.org. Thanks to Alan (Cc'd) who notified me about your reply :)
> >
> > Anyways, I looked your first full dmesg and what stands out there is that:
> >
> > [  113.907760] ======= Hotplug Thunderbolt Cable =======
> > [  116.091653] [504] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot plug event on 0:1
> > ...
> > [  116.134083] thunderbolt 0-1: new device found, vendor=0xd4 device=0xc050
> > [  116.134092] thunderbolt 0-1: DELL U2725QE
> > ...
> > [  116.862460] [185] thunderbolt:tb_dump_hop:20: thunderbolt 0000:00:0d.2: 1:1:  In HopID: 8 => Out port: 16 Out HopID: 8
> > [  116.862463] [185] thunderbolt:tb_dump_hop:22: thunderbolt 0000:00:0d.2: 1:1:   Weight: 2 Priority: 3 Credits: 14 Drop: 0 PM: 0
> > [  116.862466] [185] thunderbolt:tb_dump_hop:25: thunderbolt 0000:00:0d.2: 1:1:    Counter enabled: 0 Counter index: 2047
> > [  116.862469] [185] thunderbolt:tb_dump_hop:27: thunderbolt 0000:00:0d.2: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> > [  116.862472] [185] thunderbolt:tb_dump_hop:30: thunderbolt 0000:00:0d.2: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> > [  116.865613] [504] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1
> >
> > This last one is unplug to the host router downstream port while we are
> > just setting up a PCIe tunnel, so it is expected that we cannot configure
> > the router (Dell device) from that point forward. That WARN() should be
> > changed to dev_warn() or so as this is really expected if the user unplugs
> > the device while we are configuring it (this is nature of USB4 as user can
> > unplug devices at any time).
> >
> > In other words that calltrace is fine.
> >
> > However, why the link goes down is another thing. If you did not
> > deliberately unplug the cable it suggest some sort of cable/PD issue to me.
> > Sometimes I have seen the plug gets bit loose and that makes the cable to
> > unplug itself quite easily. The other thing might be the cable itself may
> > be bad (I wonder if you have another Thunderbolt 4 cable that you could
> > try?).


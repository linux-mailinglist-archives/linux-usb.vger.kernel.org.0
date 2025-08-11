Return-Path: <linux-usb+bounces-26683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D8B2016B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 10:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9D8E3A3A0D
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 08:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3162DA77F;
	Mon, 11 Aug 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="m/QH6VEp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A947213248
	for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899850; cv=none; b=F/hsg93lgqycjLLnZqO8sNqXIvwCTd4l9U/5O/pM0syK6cY+sR100KnDFyTSWbG8XF2FoB6T+igYESApBEpLwKgBGv90wC/PbpHjVGZs0skD0kZmuDi2w3KaOr0vYU+4jJYNr1TVIQPgyGxJ5xRa10zAtWcbpBS3vkQgPxMc0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899850; c=relaxed/simple;
	bh=dNWdxPGZirc4wM1IzhjD3o10TFH0wJpTvexTaUIQRGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8T6zex4cRi8F7uTw9UMQ6bz8e1Ff7gUofl1ciWVxFXiRHs+1hPQ+dTrTVCn6YCksRI16X/ojU2z7n0fmuPOQkOv9QjrTjKUJ0r9/glmK3GH/EQFgrEaKBhg7GhpIt/DdtLXmymwIIxM4sdD+M7tOjmkMPyeDMibJ1sGsZu6nGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=m/QH6VEp; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D630C3F1CC
	for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 08:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1754899483;
	bh=CFokBXtuO0wOpNwBiSXLopmERlgMmh8ZJZG+hXoD6/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=m/QH6VEpuvMBfSPmEZwaGvhNZeX4Fz6hlbLZbtGGHBeCljL4ZZ9xSskvRxHjdOMRH
	 2qlFnsqHrSThLXr2zuzvHiNkBrZy8Iz8d/wysjt+ZoDvgnM+0821IqeR6MkQtH7xBK
	 W8Mz51Oq/NimiV/LOgr6LI1WhgWRboZQg/q8a86XZ4r6X5nZ4VT2nD5JhFvjFxqKL2
	 e2RSQiXcYozSFiCnjt//zFxNeWF0EYyF4hcnEQTy5hgmmop5tXqqumbSJ0OzEFPOV6
	 LCC7WiZfWjtbk4mBDUd7AV25VdkeVKZZUii2HRG2AAFfyGIrhIK6GeCeldxMZ1CMTr
	 LJM7PfI/xJLOA==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b78aa2a113so1960386f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 01:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899481; x=1755504281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFokBXtuO0wOpNwBiSXLopmERlgMmh8ZJZG+hXoD6/w=;
        b=WalZmq9wEFe+kXdKNF4dm8dfIfqIoERp3PXYCpq1jA4etML6YV0wgy7xBbyCK3/K9W
         wUPcPYalSkrNaxmr3YkorIlaqHbQzwvneNxy3Z3tdhHN4VFx9nPRe2476loYZye0e2xC
         BRDYkcsHQZHJlFhtSELe9ErU7VKbU1KphC6vOtR7GwXQuIkGu1iV9onIgnwjIlJTsQoy
         4074EgBYburo7qcgBLomeELq8Esn+DZxO5qw47rG5O9zv8v+EjMn1Bux4j/SqprCnXKk
         2F7aeXi73ko+dyY+AnviMTpBHDSgk5y1NYakJfPlCLJ28mtD0fGJz5cNEsVCRf+9kMAc
         F4cw==
X-Forwarded-Encrypted: i=1; AJvYcCV3N2+MzyizcxCxIDiBcSzW+WUHbD4FsRUjb+k47iUj+jx6PAgJHzlbLLUMGNaBWEuW2KBLujx8TZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCK2R172L4xb0I3tjthx6xRJMS6ZpOrNyrSSAf5qTuEaIIRIi
	DcReTYqWkOQWWdn3fNT+nCy1s5fHKeWPj+5FHAM9U4RDO1tgDZfuzCjw3Oq21POGygwczm3WFZh
	CtVSY9/KHRyJKCc0oH4JX2kCCKLHqqiSGvA5Oee7DwOFv6V+XKIIyDLysXEseTZmzdixK1Yj5ze
	rN9ecOp7YTfv9SjItneGvf8BZ/OY1vOUgJSahkGjlejV09usR2rvGwOlE8Z9sHd1E=
X-Gm-Gg: ASbGncuK0nSE8pgthnmXoTkQhn/o06nxuFRHr9T4yNVJatwOOYzufi/pYEfxTGBBrU0
	J4FWWyfeNAX63QU/LQ7hkw2zFD2+JLR/t/I1KJImcnvYW+YtLhOI/LSl5vxvHaFERKZaWuWZx8u
	8yppfbEayhrU2f6EOU9Y9TCtU=
X-Received: by 2002:a05:6000:1a8e:b0:3b7:9233:ebb with SMTP id ffacd0b85a97d-3b90092fd21mr9529406f8f.6.1754899481104;
        Mon, 11 Aug 2025 01:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/678HroJsSn7ziuO5bLxZpQiVLlVdn9fvp5UXLgyMTLt9L9Cl2IiXKh9Xr+LeKJ3eqNC12oIm5K7pLUmLMxc=
X-Received: by 2002:a05:6000:1a8e:b0:3b7:9233:ebb with SMTP id
 ffacd0b85a97d-3b90092fd21mr9529377f8f.6.1754899480621; Mon, 11 Aug 2025
 01:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMqyJG2QceTyAONn_5m956zF_rpHLpognYYWnivm7J+w6Cw=RQ@mail.gmail.com>
 <20250728063329.GR2824380@black.fi.intel.com> <20250808064313.GM476609@black.igk.intel.com>
In-Reply-To: <20250808064313.GM476609@black.igk.intel.com>
From: En-Wei WU <en-wei.wu@canonical.com>
Date: Mon, 11 Aug 2025 16:04:28 +0800
X-Gm-Features: Ac12FXw_PQ0sh_GuxgTuYrOYRyF2_QRojqh_W1NIQa_AvScgpg_Rzaxd5Gds79g
Message-ID: <CAMqyJG3b5KsBjF=wW_+pB6MaSO0PQmq-iiAJ9aONZ6mZ1UtUNA@mail.gmail.com>
Subject: Re: Thunderbolt call trace occurs on hot-plug
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org, michael.jamet@intel.com, andreas.noever@gmail.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mika,

Thanks for the update.

I didn't deliberately unplug the cable while the "acking hot unplug
event on 0:1" happened, suggesting that there might be an issue on our
cable as you said.

I'll perform other tests and get back to you.

Thanks,
En-Wei.

On Fri, 8 Aug 2025 at 14:43, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Jul 28, 2025 at 09:33:29AM +0300, Mika Westerberg wrote:
> > Hi,
> >
> > On Fri, Jul 11, 2025 at 11:54:46AM +0800, En-Wei WU wrote:
> > > Hi,
> > >
> > > I'm seeing an issue on a Dell Pro Max 16 with Intel Arrow Lake CPU --
> > > Hot-plugging a thunderbolt 4 cable into a thunderbolt 4 port (backed
> > > by Intel iGPU) and connecting it to a Dell U2725QE monitor triggers
> > > the following call trace. The issue reproduces approximately 60% of
> > > the time.
> >
> > Could you share the whole dmesg (that is not line wrapped)? With
> > "thunderbolt.dyndbg=+p" in the kernel command line.
> >
> > And can you confirm I understand the steps?
> >
> > 1. Boot the system up, nothing connected.
> > 2. Once booted up, connect Thunderbolt cable to Dell U2725QE monitor.
> > 3. Verify that the monitor works (+ run lspci/lsusb)
> >
> > Expected output: The monitor and the integrated peripherals (PCIe, USB)
> > work fine.
> >
> > Actual output: There is error in the log and PCIe peripherals on the
> > monitor do not show up in lspci output.
>
> For some reason I never got the reply from you although I can see it on
> lore.kernel.org. Thanks to Alan (Cc'd) who notified me about your reply :)
>
> Anyways, I looked your first full dmesg and what stands out there is that:
>
> [  113.907760] ======= Hotplug Thunderbolt Cable =======
> [  116.091653] [504] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot plug event on 0:1
> ...
> [  116.134083] thunderbolt 0-1: new device found, vendor=0xd4 device=0xc050
> [  116.134092] thunderbolt 0-1: DELL U2725QE
> ...
> [  116.862460] [185] thunderbolt:tb_dump_hop:20: thunderbolt 0000:00:0d.2: 1:1:  In HopID: 8 => Out port: 16 Out HopID: 8
> [  116.862463] [185] thunderbolt:tb_dump_hop:22: thunderbolt 0000:00:0d.2: 1:1:   Weight: 2 Priority: 3 Credits: 14 Drop: 0 PM: 0
> [  116.862466] [185] thunderbolt:tb_dump_hop:25: thunderbolt 0000:00:0d.2: 1:1:    Counter enabled: 0 Counter index: 2047
> [  116.862469] [185] thunderbolt:tb_dump_hop:27: thunderbolt 0000:00:0d.2: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  116.862472] [185] thunderbolt:tb_dump_hop:30: thunderbolt 0000:00:0d.2: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  116.865613] [504] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1
>
> This last one is unplug to the host router downstream port while we are
> just setting up a PCIe tunnel, so it is expected that we cannot configure
> the router (Dell device) from that point forward. That WARN() should be
> changed to dev_warn() or so as this is really expected if the user unplugs
> the device while we are configuring it (this is nature of USB4 as user can
> unplug devices at any time).
>
> In other words that calltrace is fine.
>
> However, why the link goes down is another thing. If you did not
> deliberately unplug the cable it suggest some sort of cable/PD issue to me.
> Sometimes I have seen the plug gets bit loose and that makes the cable to
> unplug itself quite easily. The other thing might be the cable itself may
> be bad (I wonder if you have another Thunderbolt 4 cable that you could
> try?).


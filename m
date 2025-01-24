Return-Path: <linux-usb+bounces-19704-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EF5A1BEDE
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 00:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2B01686E0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 23:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181251E7C0C;
	Fri, 24 Jan 2025 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kfocus-org.20230601.gappssmtp.com header.i=@kfocus-org.20230601.gappssmtp.com header.b="wG8OeHeB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA411662E9
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737759946; cv=none; b=GbuzRej+cK1v52Hg1ldB5VFHMo3WBcWvQTQsTSl+hGTrb8dzEWPBz0BYGH61d5kYXchNvbXnLpeYc5U91Wl+l5+FvNSkPCtpF98szKq5Qwx979eigpqGJMgFCKDiw798SqBV5IizEFmqHoYplFOPscTz/JsQU08urZVQWIEhPYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737759946; c=relaxed/simple;
	bh=UuiCgonjwOZKiRYPHJN1KmfUutgqqJdCQBSTLPTYg3c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E54rXB3w/LaEB9RoGy23QovZhfrWQ8t7m6+KwIUkGQNpQpJtLpKcHvM69KN2uHoY7OUDFbuXdxNfKeRDrr8sREd2BBlIJ7em7byjO5OhSI7hj6s5df6o2Rr/gUEvrEkugFhGlHnIv6U/cJFfRp5wdVj6N7912c7CGrm6vKDc4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kfocus.org; spf=pass smtp.mailfrom=kfocus.org; dkim=pass (2048-bit key) header.d=kfocus-org.20230601.gappssmtp.com header.i=@kfocus-org.20230601.gappssmtp.com header.b=wG8OeHeB; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kfocus.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kfocus.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso178630139f.3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 15:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kfocus-org.20230601.gappssmtp.com; s=20230601; t=1737759944; x=1738364744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e76FHdrNJrkeJY4Fzwi+yyd7EZVrP3M/34uCx232au8=;
        b=wG8OeHeBHGZ8KmLgb5XarkTyv3s3OlH8dFcxB3CkSNauMm8qICqXVro7W6rPrYTlel
         SRxOl4Bnm8QgFCqaKLpNargPfh3b+VAhfVye3OmylmooDTqcdv5gSxUCsMMYchPmxzvc
         VT4MWOM9kc27AhtHo93rAfCoS6LAeaAGNxpVwyXTR5/8CzkAGyz8Cx72LfoxbRCeYmoI
         mMNok7xbWBMc/IzKQr7mOg05pJPJwEv8rRPCo37QXQlvX/vvrFkAwfAR1qGUIaSjdYn5
         m3cCkJ4o+VxY9qz2FcUfCPa3/VtFnH2jHDAldvqM8zdE1fW7Fbkcnflir5fzmLkprHEd
         85lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737759944; x=1738364744;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e76FHdrNJrkeJY4Fzwi+yyd7EZVrP3M/34uCx232au8=;
        b=PtI+nlTV/v0OP91qdOjU/kp3IKSo9joWedyka/ocjAOqB/NmgnFvefjb/OtwW1n9wq
         z04AnvlRjCoyb2mouJsIrrymTq+Lfo06DZTeNsb/b1ytWeojbqZuiivIH3DUOir8u3iM
         hSPsQHEOI0rB+iMCzP4TnccQT0+nmRod22Kbui7RdR9C0Y8BX+NlFheGkEdrLJrt6DOJ
         QnS4eVCBthX+3JXPSQupCYkJVH0G83syippPwtyo+pYFzGMtGeqK6qjEY7g3mndz/kWS
         n4/hBuy0HpKYWJPxXxlUm5dVUBAQYzLq2Imk/VWDXw8JVfmgcA0unzb5N94j8o8QOIDd
         AEDw==
X-Forwarded-Encrypted: i=1; AJvYcCVdlThmfluoB5u2GFew8PFk5o+CEqKR+Rh9wSIb26QEsNe2xYn9CcWlnQhCiEn/59oxiqq2F/JiFOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBsyjnzXdShAsdxjK/Axr/+l+ad456IGH+XImnXsnPWRtuM8tn
	H2X/zTXv2z1Bp5pjuHp2mjNnDaAbkN4u2zgAI0dljQRm7QC/IsEFvIV8loRNzeM=
X-Gm-Gg: ASbGnct+jSB0cM1C40fPCb1maUHEpbtrbHquVvzNIfeZmJG8E0FtlEJ+yqcLB5EXuCf
	e/4vVSfhQ5lpau8yq8IYVJfmhfSWrrXg/E8rqq2k6OSNRrOVTRHzmQ72PVE7mlJw6fv+lRKdo6q
	5sD15xKIOG1WIz3+NhiunPSio5iA0TsPEdI4JingJmMSOsgQLUZLVOVJAGbzuoXkAeZMX3iUneR
	GSzZvIDRtBl3rlyMy3gF6YhD8VdKvoWCXJdIae2rGB7jE8YdmyZC9tjRMveNTnVS0hzG51TrraX
	G94=
X-Google-Smtp-Source: AGHT+IG2Q7ALqV+VvfWn50mN594rqsPwSY5Iw4HwNaSS661Uo6uDVigsaMAIoCFI/wGrf+DXoNSYCw==
X-Received: by 2002:a05:6e02:4918:b0:3cf:b2b0:5d35 with SMTP id e9e14a558f8ab-3cfb2b05ec7mr122695295ab.7.1737759943776;
        Fri, 24 Jan 2025 15:05:43 -0800 (PST)
Received: from kf-ir16 ([2607:fb90:bf13:4c16:eed6:e61f:44d8:5468])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da3370fsm909953173.53.2025.01.24.15.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 15:05:43 -0800 (PST)
Date: Fri, 24 Jan 2025 17:05:40 -0600
From: Aaron Rainbolt <arainbolt@kfocus.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: YehezkelShB@gmail.com, michael.jamet@intel.com,
 andreas.noever@gmail.com, linux-usb@vger.kernel.org, mmikowski@kfocus.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: USB-C DisplayPort display failing to stay active with Intel
 Barlow Ridge USB4 controller, power-management related issue?
Message-ID: <20250124170540.1572d5db@kf-ir16>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

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

Hi Mika, sorry for the very late follow-up, been busy with other work
stuff.

We contacted the ODM to get newer firmware. They contacted Clevo, who
told them that the Barlow Ridge chip in these machines is the B0
revision. According to them, the latest firmware available for the B0
revision is 14.6; they also state that the 56.x firmware is for the B1
revision and is incompatible.

Is it possible that the problem is that the driver is written
specifically for the B1 revision and only partially works with the B0
revision?

Thanks for your help!
Aaron


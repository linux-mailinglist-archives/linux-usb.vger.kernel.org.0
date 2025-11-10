Return-Path: <linux-usb+bounces-30247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96DC44EF5
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 05:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02E283B07D4
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 04:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DC71D799D;
	Mon, 10 Nov 2025 04:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkx3NX6r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293AF192D8A
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 04:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762750580; cv=none; b=msa+ANQKO/wRMhSuWy4B5D5VPqWesOmAiTZWl71AoPJ+DpfsnhieFA1iZKvxTn6syWjrEYvVBXjUunx7b8qhIMvVCk8Z60HM/ga5Sp0HK+nN+J+ATqMZiga/N+v2yWuV03x//shVPI1H+rUZWC3jwkvV9k+pnelJIezrjegb/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762750580; c=relaxed/simple;
	bh=kD8JE0ldfMF72Jsnm53nOD4UZQV8pBMzV4u3KIK2RiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5shCO54/0sy4IQPVmUX4dWw8ZZuzLG5wjGYUsGJSkTE72otJ2Ifnlth3xAvJwCYt1ZbVpf719PddS29RvFStRiFvN0L6RIqEXFvy96gsIDGt3p+R9Ms9Ih5bjXe34zd99JWw+sXmsAipljKi4MWZwHE53AGeprg1xsL1aGAYhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkx3NX6r; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b62e7221351so2151462a12.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Nov 2025 20:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762750578; x=1763355378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/g9RT5BWmm6cjMoL5sdC/z2mP6coJ1Ksj/ik0l5M++k=;
        b=nkx3NX6rAcwSmrLpC2Iix64eYq5f0KAjnwPvhZYGYbb27JdQBMr9ZO8ouduKKkf218
         fd6bgVBskYxW4ARJ9MdsnxPuwINYJvhQS6pZz1nIXbnfeMnaUrtxuj+jCSIHtp48TQGS
         oORcgG1BdIs/o/9xsCLIy8TqPLWUijGP5CNo8NuAt087Ioo6Acbaa9hdkrKVYgCEsk9X
         bVvk4K64I2/5wO8R+IvKVbeHS+B94iiYYv0XBHXGSqMyd4q5a6ypGyJ6pfi1AndCBKOG
         5PTWuqYg6LmAxF1F/1u8VXWHxYusfRurmf9DrjxKMgI9qwGnbF+Jk1jXp4y+xRe45oST
         XZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762750578; x=1763355378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g9RT5BWmm6cjMoL5sdC/z2mP6coJ1Ksj/ik0l5M++k=;
        b=QWFQfsIGYDsu0K/O2ZisQhSx46DOaVc7EBDa4vCnmaHFcHpggJ4sEE3ttCosI3SCr4
         9jmHpctNngr9l3AB68fCdL0I921NyJi9ixIDqDiGA0igtD6QNiCgz9iA37S7hskjQ2QV
         eT0czs3T70GwX5X8pgoIDnKdRQBb0kXTpuWKLNHNoQX8miuy7iR0sSbhiDVJKYWUJdEp
         h/3sMs/n1Uv7bCWRt+G4klLbaeB12Ktv7tr/T3L7YkF/wbNMtSSuhXa2PuU9Q5O9sC7n
         b1xtaBHbA6wJweMWY1F4Jp0U2PprONKA5RAAJxMLveXP9DMY8xiR7cT0DtdsCLQz55Vh
         VoAw==
X-Forwarded-Encrypted: i=1; AJvYcCVjRbO6VQwFqXSTJdhwd92LhewSGOEEQHygQQQiuM6TK6qwotwXhOMCq47piYSZBDuGd19zaJFEG2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjpl5bj1NFWQdCQReZobAC4nxVOIb2OWOrKlktFueZOrJMflt
	A6Y+7MO5ljGDM/eMgDLM19JYj3dLJxzFwU+tNcBBpyk5L3UV+sr+3OJV
X-Gm-Gg: ASbGncvZ6GZaTN55Ars1IWw9lYxkjMuO5IiL93dFnmtej2NNtrhONHnX6Ct0M7wPD97
	eYEP+MPJqFIlI6NmFefBqPOCIdy/PgIAA+VabzZyGox//KF5o5GtGcuLQlBJPRyxh1yoZnGY84N
	rCNtxP0C1nlQe0dYNkQrgUpwZE0mBP4wq7NsG0ZooeZrewtsYbQ/Ca/AyO4bd7M/yPtEVwQhUxh
	0LRDAzRA5RNsTZglq8UM35/NmVxtPEzon+kOG5mmCZZqsWJaDPZaUdwThed/Oe4LK5GAntaCFl8
	BqEuyh7k33UwKtesY3BPw74yfYMoxuCIgoHq/Bx4sh9yEFlUHwXeQyWymor+bJaFIMY5KiiRYcU
	5xl52UmSWvYAp7TWNjQHLSVHIiH4SwgyuFU8jxd0ryiXBhJ+1DYHdLAO9lrgzE1jgEdW9twuxAz
	yo3PaQi4wIJl7fc7CCFBWA5vg3z1aBEQHhLVgg6YA=
X-Google-Smtp-Source: AGHT+IEBAo6RtH1Jg2e37hZ75erpvksr4D4Z0PI6Qbc91G3q5pFTg+AnAK0+1j+pI7SNBNpFrsxmow==
X-Received: by 2002:a05:6a20:94ca:b0:350:ee00:3c9f with SMTP id adf61e73a8af0-353a24f7cbcmr9400564637.48.1762750578474;
        Sun, 09 Nov 2025 20:56:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c16c:df12:2ae:2f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba9024e6e17sm11057841a12.34.2025.11.09.20.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 20:56:17 -0800 (PST)
Date: Sun, 9 Nov 2025 20:56:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	The-Luga <lugathe2@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Terry Junge <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
References: <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>

On Sun, Nov 09, 2025 at 09:20:15PM -0500, Alan Stern wrote:
> On Sun, Nov 09, 2025 at 02:49:23PM -0800, Terry Junge wrote:
> > 
> > 
> > On 11/9/2025 2:17 PM, The-Luga wrote:
> > >> But never mind that.  Try using the usbhid-dump program instead of
> > >> lsusb.  usbhid-dump does not require you to unbind anything or change
> > >> bConfigurationValue, so it's easier to use anyway.
> > > 
> > >> sudo usbhid-dump -d 2d99:a101
> > > 003:002:003:DESCRIPTOR         1762723663.045959
> > > 06 13 FF 09 01 A1 01 15 00 26 FF 00 85 06 09 00
> > > 75 08 95 3D 91 02 85 07 09 00 75 08 95 3D 81 02
> > > C0 06 14 FF 09 01 A1 01 15 00 26 FF 00 85 2E 09
> > > 00 75 08 95 3F 91 02 85 2F 09 00 75 08 95 3F 81
> > > 02 C0
> > 
> > Second HID Interface (Interface 3)
> > 
> > 06 13 ff Vendor Page ff13
> > 09 01    Usage 1
> > a1 01    Application Collection
> > 15 00    Logical Min 0
> > 26 ff 00 Logical Max 255
> > 85 06    Report ID 6
> > 09 00    Usage 0
> > 75 08    Report Size 8
> > 95 3d    Report Count 61
> > 91 02    Output
> > 85 07    Report ID 7
> > 09 00    Usage 0
> > 75 08    Report Size 8
> > 95 3d    Report Count 61
> > 81 02    Input
> > c0       End Collection
> > 06 14 ff Vendor Page ff14
> > 09 01    Usage 1
> > a1 01    Application Collection
> > 15 00    Logical Min 0
> > 26 ff 00 Logical Max 255
> > 85 2e    Report Id 2E
> > 09 00    Usage 0
> > 75 08    Report Size 8
> > 95 3f    Report Count 63
> > 91 02    Output
> > 85 2f    Report Id 2F
> > 09 00    Usage 0
> > 75 08    Report Size 8
> > 95 3f    Report Count 63
> > 81 02    Input
> > c0       End Collection
> > 
> > Two collections, both vendor unique.
> > Basically HID 'pipes' to transport vendor unique data.
> > We have only seen traces with input report ID 2F so far.
> > If we could get traces of output report ID 2E from Windows running the 
> > vendor's software (TempoHub) it might help.
> > 
> > I wonder if suspend/resume would be a problem. Maybe the device crashes 
> > when it attempts to resume?
> > Windows will not suspend this device because it has a Consumer Control
> > application collection.
> > 
> > Is there a USB quirk to stop the kernel from suspending the device?
> 
> There is.  More simply, The-Luga can do:
> 
> 	echo on >/sys/bus/usb/devices/3-2/power/control
> 
> to prevent the device from going into runtime suspend.
> 
> However, I doubt that suspend/resume is the problem because the 
> disconnects occur whenever the brightness knob is moved, not at times 
> when the system might decide to suspend the device.
> 
> Also, I suspect that the computer doesn't really have to do anything 
> with the HID report data from interface 3, just accept it.  At least, 
> that's what the packet capture from the Windows guest seemed to show.  
> By contrast, the usbmon trace under Linux showed no traffic on that 
> endpoint.  Without being able to send the data, the speaker's firmware 
> could just overflow an internal buffer and crash, who knows?
> 
> It would be nice to get some suggestions from someone who is familiar 
> with the input subsystem.  Dmitry, can you offer anything?  For example, 
> is there a program the user can run to collect the report data that 
> currently isn't being requested?

Jiri or Benjamin would know more, but maybe using hid-recorder from
https://gitlab.freedesktop.org/libevdev/hid-tools would help both
consume and decipher the data coming from that interface...

Thanks.

-- 
Dmitry


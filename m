Return-Path: <linux-usb+bounces-30314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3849AC4B5AF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 04:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E22C94EE4F8
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 03:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B34314B8E;
	Tue, 11 Nov 2025 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="k+bnOdjc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE121346FB9
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762832580; cv=none; b=h7XhSI7Oczil5PGTOmlwDm0v4g+EOnKeqB7zCIRa7+FlGDM9mUc7ottM4fsxyjoVgR/TewcAUMalK8ep5pGnV+ZpQV0mqYusjVnr2235VGxPaiPRiJH06ma1ZXuxlMG/a+/8xlN0cc4ezX4RY4n7SUSj3J+/1KFUQOoT3AiYRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762832580; c=relaxed/simple;
	bh=g6jGAcvwVh/icnz8bdIbPAM/IeCRuZBYyx7sd28ajFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1sYFx36ae+MD0+WkNTxJzeNqgoJF+cgQROPTEftSDKfK7teNoeNRO/G7fbCtGV5jzWQ7PnTds3pHHTd0As7ml5dutYv3e2S3/pfnxup1f3I+0AdzglQrG5Yl9KC5LCEDgv9KoYQR4gFcBxrn4Shz/bYb7upafan9J3XpLJaUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=k+bnOdjc; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2655e0bb6so239104685a.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 19:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762832578; x=1763437378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6/LD0uDQCSe+chbTWf3H4rmcFTKbJ4PUWI7IjCyqUo=;
        b=k+bnOdjc3h3fN0DBJEjWccRsZENJafZK8a46Jr7Oz61VgisSscX5Fux+Ds1UEocPgB
         gRuhd6Uf7C6Qo9/EKpKXbPiB/BJmo1avHlI96pNifmPGm8IFjp6p3FT3DeWBZtpA1BtM
         e+4vmt+/pJ+69rTzsXm8xi2isbDlHToGefxuwSifW95Mb4C8emAL711j09jVru44ugye
         6cdMwahbScmpiJZauCpoM5i8MO2xr3Ehk5lXBCtv6d0mj/aFADzR0g8YCq0zl/Lgu0Uo
         Wuvn6V6QrqHHlb7Mpp9Yj1I20+H13idjJi9E7B1ojB5ZOdJRUDK2oNL+BaVAYrXQiiRt
         clvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762832578; x=1763437378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6/LD0uDQCSe+chbTWf3H4rmcFTKbJ4PUWI7IjCyqUo=;
        b=PgE6bG8OE9WJ0VlZREWF5JfjdbEHVW2vjHMPgNMS9adHagJCMo+jvsMYJXPKQF9rLv
         DrL8wUIeT535Z7w8e6OTj93UvKUN5qWP1AmT5SmgRlcZGcJTyxuBRI2u0VNa34THVTi0
         l+e0H7iE7EXpam4jbbCE6+T0faAnBFFfk7lrKYIYQ4QXTaGqoBLnuOpvgCcCwUnUJgnC
         VCovB5abmxee2ahZ4cEQ6JdJ68awDYL+76V5lfayDB1/+a/LVEryNM7+1yeVaGJQoVTd
         Bc3bv0nQ7IykF+TkN9YSv3QFDdEiSn4PPiQiMzjEFlaLybA5ouN5mE+MKADJ3avQJmes
         ZFDw==
X-Forwarded-Encrypted: i=1; AJvYcCWlQ5AZXKYLrgnW4Ru43pmxgwcRF1s6QBcHpvot3qCCICrubzsUBf03aUQUH1nv3nOxBmDqDrN+6Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/aNyESjoN7EqZ4/gr/JjjExZssSyBK0bV6LQjGCx7R9E4zM8P
	d1UmlbwbaWtVvy/ngvkqMVgyh89MR+Rik5gkfo+CJSH4ML909UHLxWoH434MQprAbA==
X-Gm-Gg: ASbGnctMPpDsd9fyTO5DQCmDqGsnTkbbz4aSSaaBzSB1bazlj1Yt0+YYrXvGcJXgoq/
	YWo6he9yZvelQ6mrD7Bb4UcWbdi2t4b/rEdAhepjBqyTCIv+cWB/fvI2BWLVEqXQDKTtnOrmeIQ
	kq2JrLcQYAzAnyA6cOAGoo7h4SY3sNCfZ+zslKMbAp/GaE035e2iWIwDS1nXyz6n8ceRRlqHWGg
	Vh8Xu8lpvbIH/a6kTCuWnC/4nld6Bqy6RwxSu0kDGuj12teJrrclVu0ZDf4uz4gh61zTboEnkFl
	wH5OaFhCDPgFDPNhM8hqn5MxQjbpabXd2q8GAs8EwapLgVok3nYQlo2gDimmy/m+Qq6UjyBZThY
	825blLf4R0z2ZXBpYwDD0xdYKx+ItsTqlTVBJ1y+byc1NnwUtJGMyTfUAeUoRPLGm2i0N/puD6I
	bB7JMeiQNpbqHO
X-Google-Smtp-Source: AGHT+IHYC3JVh4zkjwBpZ+raijFxCEzh4VWT1zLA6Gt658oaINkv6SV2JCD2CK20MPRQgCSoIXoI5w==
X-Received: by 2002:a05:620a:2a06:b0:8b2:77aa:73f2 with SMTP id af79cd13be357-8b277aa7784mr860421685a.12.1762832577612;
        Mon, 10 Nov 2025 19:42:57 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e615bsm1135123385a.19.2025.11.10.19.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:42:57 -0800 (PST)
Date: Mon, 10 Nov 2025 22:42:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <46ecf459-85f8-473b-83da-99fc0ae78463@rowland.harvard.edu>
References: <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>

On Mon, Nov 10, 2025 at 08:48:57PM -0300, The-Luga wrote:
> From: https://github.com/torvalds/linux/blob/master/include/linux/hid.h
> 
> #define HID_QUIRK_ALWAYS_POLL          BIT(10)    ->  2^10=1024=#400
> #define HID_QUIRK_NO_IGNORE            BIT(30)    ->  2^30=1073741824=#40000000
> 
> Sorry about that. I'm still learning and the documentation was not
> very clear on this.
> 
> Trying the 0x40000000: `usbhid.quirks=0x2d99:0xa101:0x40000000`  the
> usbmon stays silent when changing volume/button and reboots when
> changing brightness.
> 
> With HID_QUIRK_ALWAYS_POLL: `usbhid.quirks=0x2d99:0xa101:0x400`
> (reboot does not happen).
> 
> Is there a different quirk to try?

Why would you want to try another one?  You've already found the quirk 
that fixes your problem.

Alan Stern


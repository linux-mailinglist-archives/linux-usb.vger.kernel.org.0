Return-Path: <linux-usb+bounces-14392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB511966438
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C2D282749
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8AE1B251A;
	Fri, 30 Aug 2024 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BknUcvQh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35B199936
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028269; cv=none; b=L6FlbknuPzBR3q1+bcOcdnlfNnEmFVLSDDMM/QARafJZ/dn0CYdUXMC3a3WxuviGXWIpxwM3YIWDzEc448USlRThUl9brxDMiXYwpxPldj6YQeXoBxEyQFdd7FK4/iO0rp6dbKu0l6DicXFwMiNg8A7TplQQ0FObhGzqJDrYHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028269; c=relaxed/simple;
	bh=4dcSA49BkJy/R9KUnxZoe5J5zDu38tDDwZHyvi27NOY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=q/xtT49v1Cbut5Lwpw67u0lShcuS6t0GYWkYYIhl67oQsbUpRJf5umT57AgLKARAuoHDe9MFoCbQakZyoZNMW6lMpcAfZOY/Ru4g/FATqyoQ+lO9L701P9OHQSzbYR3GhjCM+/wZAXlo8/4OJeetS5NzDkMFlt86o0udg9ccnJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BknUcvQh; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so21144291fa.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725028266; x=1725633066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4dcSA49BkJy/R9KUnxZoe5J5zDu38tDDwZHyvi27NOY=;
        b=BknUcvQhnFSNn82QqKWw27WF55E7h61qhdNbaX2kfsxKm1jqid36wIWMNAaOzo9Fw6
         ltJAamvWOU8NUhL2rEygxdKHlgPlAkpCTBIE6vQ9bVVyubs1pVk1J044N2h3hw3t5ATn
         nTPX7KKln66ztLimCziw7WSaxrVArVNemDr+fXKeHMQPLrxADTeksJKh/tEAx7myAUdX
         xYJXtnrKPjlmff0LT/ct0FB1mmSvMHn0ua70EKVJmthCwslJwZXDH/tjoLPRdPxnj5mR
         EX5wLS2d7N0IKPa6rpPANLsNpGdBaEs+ID48ede260kEALyO34QVNKczoJrL3Ttdy/+z
         nRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725028266; x=1725633066;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dcSA49BkJy/R9KUnxZoe5J5zDu38tDDwZHyvi27NOY=;
        b=Z3Ht6zXHZRe1dsx9TgDE10I1cg5FmdLZ/UjO8dvdH4YbNpND844tKRz8/nXhEHucPW
         B+avO6fUzRmuUu5pUs2yPv3GxT3BuaISd5kL2Vz1MSJclTyv70lZKMkPBWRBlFBnO1LS
         LCshqUacsRsO3bm1AKaHgf8UgB63PvQf4vSh2Fm2LqrfGP3RYhcfUpGXfSp43vE6ggx1
         svu5/0fRcYeIBZk0ItLAO+DR70PKEMUW3gEu/MIR5u1wMQWce8KBxLcpvLibb909Kyx7
         eAS1fzisDIEqCT2tcaHmJ3G3ADeU7QRTBkDxHr1vNe/20LmrdI+BIqsqoURDMNyH/lCC
         1pfw==
X-Gm-Message-State: AOJu0YxjhkdjtgY90ABk/RSfjLi2DS733IibIyLXfetXvMs6kR3qMGWu
	CymV3TD9cfJJvzfg4isRmOrlACHAavN5QEiGCH5rzjHiFuCsHmK9
X-Google-Smtp-Source: AGHT+IGc4aSoIqDX0P2i/XltYO1ui7904hRxxyhRxtKc7fKSElDHQW8wuulGoU66Ke44krI8MGgbYA==
X-Received: by 2002:a2e:751:0:b0:2f1:a7f8:810f with SMTP id 38308e7fff4ca-2f61050f67dmr32038781fa.36.1725028265970;
        Fri, 30 Aug 2024 07:31:05 -0700 (PDT)
Received: from foxbook (bin33.neoplus.adsl.tpnet.pl. [83.28.129.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615171c00sm6778571fa.99.2024.08.30.07.31.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Aug 2024 07:31:05 -0700 (PDT)
Date: Fri, 30 Aug 2024 16:31:01 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: eyal@eyal.emu.id.au
Cc: linux-usb@vger.kernel.org
Subject: Re: Understanding 'lsusb -t'
Message-ID: <20240830163101.54e82db7@foxbook>
In-Reply-To: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This is nothing new.

Shocking, maybe, and only until you get used to it, but not new ;)

A USB 3.x bus is logically two busses, one for SuperSpeed devices and
one for high-speed (and slower).

A USB 3.x hub is logically two hubs, one on the SS bus and one on HS.

(Note that you also have two root hubs of different speed.)

All other devices are only on one bus. This includes USB 1.1/2.0 hubs.

Regards,
Michal


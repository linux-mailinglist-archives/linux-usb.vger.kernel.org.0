Return-Path: <linux-usb+bounces-16245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631A99F692
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 20:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE5C01F23352
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 18:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62081F80BD;
	Tue, 15 Oct 2024 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGXlLgDe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528A1F80B7
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018358; cv=none; b=kYQuCyBsDpe3oUwlBV4Q4k2lpnLl08LsfA4F/AZsCk1uq5xI7/C0yhfYoBWj6r61HvifQLJVq4GeLEOmlQbNZTyrqhlGeRVX8B6xA2/j7852F1FHr7Ww4KR2R3hTvp89vbDOTIFBdcWWbD8JZulbNgtNieHF4lBcAvGnVuE1xvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018358; c=relaxed/simple;
	bh=w77w6spPUppnNxaNHBriNsSPE2w3m9xGrZMChNwQJSE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KqpDvrNsSJgCd/9hXgCDev4EfwVV3vv3X3r4p8nmSRyn4gH2ZOXfeCIoJmRDSH+Qcmd9VuZ+9OfyfQv5kFqc1yx62St4Rq84eaijf45UHlK0e3P1bPuYPtpQ/wd2GWah/w1KZi0+IqeLlHf0EcxYo8iTEsgrI6HixX0sVTBJebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGXlLgDe; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fbbadf83so2827713e87.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729018355; x=1729623155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Yn9xVnIiA8sD6dKexSvbI0TgwvJCdhcft8mRh1v/Qk=;
        b=iGXlLgDep6ZvRAQE2lnzK+YKncBl/BJOunVLBYrJ8RPjrkl4j9oEPoniANMmaJxvpu
         GMK7DeDT8LOUon7hratz6383GBQFVqQ9n55zmjcoHWo7H6J4JK4pGq8/jtgO/QOC3OAw
         lmUt5jThqyfR5iBWWImclba5U9pTFrJMfEjyAH1yi6HNAZrf+nRzI8zxaR+Eic854ITZ
         eJrQnguTW7urG7kb4NK1h+jYXcUtjWnNqoBEb8AMrrd8FGFowb8d6hDfL7L9+w5IDqqG
         Eb6Q81uiU/1/G3WCgJCh8213r+NAim/1LDE0rj8UoD/sv32uagTwvtOpMwGRaLYUTfKy
         ETpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018355; x=1729623155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Yn9xVnIiA8sD6dKexSvbI0TgwvJCdhcft8mRh1v/Qk=;
        b=um4hLYdz7qr64DVfN1wwad1refWa4/2hnGfrNv5AIjib7+vzun0iXS7qBIU9uxvFVM
         LQcncznSgcWlOqKRiNRjxZBqCQhqYsp6EQsP+AGLEWKE2lHi65QJvAh8y8NCEuT0c6+B
         5U5In9RZCEUKA6JwPumk2/HvEouBfMBIna84ZaDfrjeh6TQEtIApfMM0czP6PmYsKOum
         23scZFUWPgcXaht6gZlmy7sN5VJyLqcJa64o4QD9QBH6UgSh0rPkqjknsF8UGReEdxTX
         X709bpj81efMwzbKKYNKOpbWCW3DNp9ZLYtBHwGC+D++T4fsZLOWTheSODuZjnQJD9ae
         1zHg==
X-Forwarded-Encrypted: i=1; AJvYcCUlKTtaIaeEVZvhFFt46Ya+wlj9QvUrh63xjc+CmCG8n9wHvomLZVUNMvYn8bsKccuBkpa55sjm7dE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzx/EZwYMo+SL7gj9KKXMjo4/Sr3qZML9dsXwI8hJZrEMChOOW
	eTb4yaJCEok6eAgcAuKuWRAmCpUsc4/NJKsUj0LEccM2aXCVl1xhStRaMg==
X-Google-Smtp-Source: AGHT+IE68THp+1yqPfAWwTZgHrHBdD/z7h4sDmhT29I6QFewEnQjlFzT7WG7uWeu4hMystI5Rb2tBQ==
X-Received: by 2002:a05:6512:1050:b0:539:e9f8:d45d with SMTP id 2adb3069b0e04-539e9f8d6d0mr5855137e87.52.1729018354601;
        Tue, 15 Oct 2024 11:52:34 -0700 (PDT)
Received: from foxbook (bfe48.neoplus.adsl.tpnet.pl. [83.28.42.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff38fcsm232689e87.121.2024.10.15.11.52.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Oct 2024 11:52:34 -0700 (PDT)
Date: Tue, 15 Oct 2024 20:52:30 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: xhci: Warn about suspected "start-stop" bugs
 in HCs
Message-ID: <20241015205230.622edcc7@foxbook>
In-Reply-To: <2024101534-roundup-promotion-eb13@gregkh>
References: <20241014210840.5941d336@foxbook>
	<20241014211122.7cb5b133@foxbook>
	<2024101534-roundup-promotion-eb13@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> +			if (!(xhci->quirks & XHCI_NEC_HOST)) {
> > +				xhci_warn(xhci, "Unhandled Stop Endpoint failure on slot %d ep_index %d\n",
> > +						slot_id, ep_index);  
> 
> If a user sees this, what are they supposed to do?  This is a hardware
> bug, but with this we are going to get reports of "something broke in
> the kernel", right?  Why not make it just more informative, like:
> 	xhci_info(xhci, "hardware can not deal with...
> 
> or something like that so that people know we know about the bug, and
> are working around it, but that it's not our issue, but rather the
> hardware that is at fault?

Yes, the point is that ideally some users would report when they see it.
This is not a warning for a bug we know about and work around, it's for
hypothetical bugs that aren't known. If I'm adding code to handle a bug
of my HC, I might as well use it to sanity check other HCs for free.

Ideally they are OK and no one will ever see it. I tested several HCs
in January and found no similar issues. Maybe I will test them again.

I specifically worded it as something the kernel could do better rather
than the kernel just whining about something incomprehensibly. For the
latter, we already have the absolute classic "ERROR Transfer event TRB
DMA ptr not part of current TD", which would often follow this one, but
offer little clue about the root cause. It's kinda too late by then.

Regards,
Michal


Return-Path: <linux-usb+bounces-16387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A098B9A3033
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 23:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585101F22F76
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 21:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFE41D63DA;
	Thu, 17 Oct 2024 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr9ap2uG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A261D043D
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729202357; cv=none; b=UN1Cr1odDi7Me+St5Ce+GBnduY+tZgGWzuPl9eP+ky0mYNbWq1cVUXT60W1KxsEnvkJEjk7QCtPSrQ0uwWNx6dszrv04KYA3EsPKq8MPdmI7vso4au7FLLW6hmSAZm07gQjbGz23Lt4Id8hzy41vTQ1RfUl8Z/OsNmsNmw26EWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729202357; c=relaxed/simple;
	bh=mSAQSvZNt2wrQHtR54DrmKywFEbBonITIYpDNbKyh+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=FgaP0aYisuQpSrZobgY2oJsUfVNGyFL6A2vZ0tnMrwrverEjhoQEvE+VUm63ese1IB8BoRoVBR3jSQ5zE5Eghy5GmIRK2T4IvIWyhtqeaKZsSFulK270qKVtFE9Rp+xZUzFb1XvuPfP+YBnggbLT/R6cbJRQNxos6XlL/SwyIdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr9ap2uG; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso15448871fa.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729202354; x=1729807154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvZsxc+fyIZrjNgRsxJ9Si/bcoh3Yjb2nRVMezqQcIo=;
        b=cr9ap2uGJR/ZoII0MnBauVMIxjo1k0Jm3E+6TY9dAcyi7DMWmfMPUHDyzY5k5lxdbw
         /sT0LPgYnklE0yfoFsyQjCPab6QEMKReaMh2xkVIG8qCu+8FDeg79k2pcW2BYity/F70
         Q1tJl6shEiksApr5z3CHf0tpcnkZS0s3kaqog6gsfVwaE1LUI3sRqDi9R7LMWV+TKabV
         jJJH99eU3nvXioRXVBX0j6AqFH9IzjY/54IWAbD/J84YW5Xi5hNNnqhXgsgVj4i1dZdU
         IdAj2QcDAaiblwaJfZEhV9bcXfmXmkclAnuSi18hNpp4US3AVJWxEMH7qmoFYUkhk2qG
         qLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729202354; x=1729807154;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvZsxc+fyIZrjNgRsxJ9Si/bcoh3Yjb2nRVMezqQcIo=;
        b=pQpkmauaLJxhvnGsgNQQOI4hII7SxOfjngYWb9iuXetycxQK5KRqUUufZjsPImSis9
         OQYsPeKRVrx1622nMMO7fyMLlrKMWyqNBLM16uYifCSQI0DNDNtTwuEB/IeMZNhP/Can
         vsmDpe5esN2BoIPVH+FJTZZCdw1MErBONCsWe7N2kTvWPnPXH75irqNWPlmyS9rq3Iy+
         JPTHDE0FrBIT4dpZ0iy25uwH8GtYGN5xKyyyJouPGVU+WZ+ZDGvc5GXd8LKzOzbxgO5c
         REDzFzdmqCF6jfjVJjvH2TdGy8dMS2dzgR5tYTclmOT7kDr7ngbm+kYabBjr6Fxxh76y
         hm7w==
X-Gm-Message-State: AOJu0YwyndmHq848s9mZsjdlHyBdrbLrCBumwPFZgHmaiFTxjTQqdZ0u
	ckX2j5c/IGVv02tOl3vj+rs6GkoaOjccEw96VszklBjbv/Qbv42OYOCYMA==
X-Google-Smtp-Source: AGHT+IHZwNZ1jZZ70N2Uu+7MoYnORTcRl++hNyvGmuAAz4qzluS4uq9SX8hxbhzWdGv12e5rjvyvMw==
X-Received: by 2002:a2e:bc1e:0:b0:2fa:beb5:11cc with SMTP id 38308e7fff4ca-2fb8320b96cmr234211fa.40.1729202353428;
        Thu, 17 Oct 2024 14:59:13 -0700 (PDT)
Received: from foxbook (bgw164.neoplus.adsl.tpnet.pl. [83.28.86.164])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0de5sm39826e87.127.2024.10.17.14.59.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 17 Oct 2024 14:59:13 -0700 (PDT)
Date: Thu, 17 Oct 2024 23:59:06 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: niklas.neronin@linux.intel.com
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: [PATCH 1/8] usb: xhci: simplify TDs start and end naming scheme
 in struct 'xhci_td'
Message-ID: <20241017235906.14672ad0@foxbook>
In-Reply-To: <20241017130508.1293021-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> Old names:
>  * start_seg - last_trb_seg
>  * start_trb - last_trb

Actually, they were:
  start seg - last_trb_seg
  first_trb - last_trb

which makes even less sense.

> -		if (new_deq == td->last_trb)
> +		if (new_deq == td->end_trb)
>  			td_last_trb_found = true;

This looks like it wants to be renamed as well.

Regards,
Michal


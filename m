Return-Path: <linux-usb+bounces-29299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A76BDB534
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 22:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BFC73AB934
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 20:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8792A306D49;
	Tue, 14 Oct 2025 20:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="p1FmlFmf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E263002BD
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760475189; cv=none; b=OOuA+Bl2bBjp31T8/ppJMc5YGjkETKlbGcbcIERwN/rU2ON4QaPWOk80WCR8bLegXsNz6z8FJVUACnf3AsaapsFZ3pwoQzPcjAqxHn/EMhw+JocDxcNqJuNrpqopK3ZzS0ACAWre3wJdBG0wiFs582v4rx8aQra1mzChOEmGfj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760475189; c=relaxed/simple;
	bh=MaULL3hJx6iYeigIBADiMv7AmNxmbq1AyBxOvhvMOKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiCnq5dNGNAt9BB2Ti4ONo7meJouYX7lifaRwDlxgqxG6o3Gk4IClbvO3ATZqqDA/lXZc8kJRnY+GJVrlhh5F8rXDqxAnoFTcsC5u7HPb/qlr7VUFHBXqJGhirwdZMLIsXOL70EkaeUX/UPHSWAFboP1no9R7Qc8jOIsZ2xGm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=p1FmlFmf; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-883902b96c3so491444785a.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760475186; x=1761079986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fl5sADz/8q9KzwLSAkG7lxcp1UM2F2pHojAxQcAaYMY=;
        b=p1FmlFmfeJTqFr0mIpuL74wuW0vamgEhU6uRsReSn1CldCHHnWzDDcx1aQLg6i5PW5
         AVykORXx3OM8l6SR0XEwK4S51dHwkR712tCDNbvmNB0Qgr8qve2v9zex7MsKy8fiW7p9
         34emDPPVhY/OEqND5l8Bjal04ep/vaECz4nhcw2JE1hBYM4OFeNwqE/ZpnP+6C+BwQao
         u6f5/q7CClJq5vMIEZByKEZ6U57KK/y1y+Ra8GT3TkEmX/kLfhtfEwNYBPsOPjgo2pDO
         ot6MIH38AJTU9kBB2ocnVrf/L5TJ4Ys2SWAR/NDypDJYFUAKruTmZSjHCgjBsVrNdNj/
         /4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475186; x=1761079986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl5sADz/8q9KzwLSAkG7lxcp1UM2F2pHojAxQcAaYMY=;
        b=pNJhPyKd3uMRbaAlB3hRHRit4MFEHuQpddqgbMGWI0YWD0G1gFxk8jyr8CYLNJ/lgS
         KDH60TgmTfd5T+B/xbmX60eIWIrCcbOWZroQrNYXc+/1WWy8Pu448VZPsr2V8RwHqbH/
         t0JWcY5SO8F9J5Y1t2WC4IrOnNp7D7aUuRdPuiSF495E+NB0kNPFmdKwyws9gEXsQO80
         TwdRmjcc50mfbSOLTisXSZsaxsHC7y1oy4k11WYwislVK8ouFSRSHIL14QOVgxT46m3D
         SpXcxeTHKEvhBr7v1jtA/++O13VOTbN3f5gR3OuYrgvFA2h17jpm0JpCHbB2UUF2Bs0b
         r42w==
X-Forwarded-Encrypted: i=1; AJvYcCVqGx8ObJ23eDlBMYESBgikcJ/TAog5z8crF3vR5f0rA0QfX39PAwq4WW0Dt6E5vwC0jCE6DLbM3v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyXzvYYOGS10s9hYNI3rieboA3uFeOMRfflQ6MWNkkFO4pn0nK
	WH+P7PNngjWO7QA8IYc7rgJIgYEdT7rxa2/ZwAnXKRJHTvjQI5Zq1vtxA608uTkmrw==
X-Gm-Gg: ASbGncs2CQrM32ee4WmnGVotnn6r6hgwCXKSoyaJxl80N/KQrX+BWMqMkJU8Eml+zpA
	sTf9me2kYI88Cdi2vjqREJTyr2+lHmQof/3L3vLivSUPsa+RRNLsCWkYjKpzyKso5BOCK3jM7lm
	hQxS6psS0SlPp3Kw046nPTJIA/AHd28TEhkleBEGFe3Mb7Jtsd+YlvEhLVg5JgZykoOzIT9IUUO
	/rPKCQaWyT9b7qrwdn7WHaIquJu630RQnZ99qAFVF09jftQ7gLa7DZmbTxuhVmrzg0ma16z4mBA
	lavUp8A4AEP6TwwFoeK4ZrI8Xr0rhxVPiQl56fXBMogWgU534Hxu4jV2NYlqoOplzBuAdftnBqC
	zdZQ3wzITvnKSJjrMGEKT44Wi/sQmN92jrmLV0saA5/NBlf7F
X-Google-Smtp-Source: AGHT+IG2Qj7ViQUv/Wby3iwc/u8L47gyNsRnas1sZipgOqVoYu8K33lTGKKw/+idkqno3+TmHSUASQ==
X-Received: by 2002:a05:620a:40c8:b0:829:d46:78f5 with SMTP id af79cd13be357-883550968a1mr3564794385a.37.1760475185795;
        Tue, 14 Oct 2025 13:53:05 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::9c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca4185sm1257331385a.31.2025.10.14.13.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:53:05 -0700 (PDT)
Date: Tue, 14 Oct 2025 16:53:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: core: Improve device lifecycle debuggability
Message-ID: <8a7f7183-38f5-4fa0-8585-88a01648617f@rowland.harvard.edu>
References: <20251015-usbcore-tracing-v2-0-5a14b5b9d4e0@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-usbcore-tracing-v2-0-5a14b5b9d4e0@google.com>

On Wed, Oct 15, 2025 at 03:50:50AM +0800, Kuen-Han Tsai wrote:
> This series enhances USB core debuggability. The first patch refactors
> device state updates into a new update_usb_device_state() helper 
> function, centralizing logic and preparing for tracing.
> 
> The second patch adds tracepoints for USB device allocation and state 
> changes, providing better visibility into the device lifecycle.
> 
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---

For both patches:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>


> Changes in v2:
> - hub.c: Changed the inline function to a standard one.
> - Makefile: Moved trace.o to the preceding line.
> - trace.h: Changed the speed and state into strings.
> - Link to v1: https://lore.kernel.org/r/20251013-usbcore-tracing-v1-0-b885a3121b09@google.com
> 
> ---
> Kuen-Han Tsai (2):
>       usb: core: Centralize device state update logic
>       usb: core: Add tracepoints for device allocation and state changes
> 
>  drivers/usb/core/Makefile |  5 +++-
>  drivers/usb/core/hub.c    | 30 +++++++++++++----------
>  drivers/usb/core/trace.c  |  6 +++++
>  drivers/usb/core/trace.h  | 61 +++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/usb.c    |  2 ++
>  5 files changed, 91 insertions(+), 13 deletions(-)
> ---
> base-commit: 5472d60c129f75282d94ae5ad072ee6dfb7c7246
> change-id: 20251012-usbcore-tracing-76f00c9b2b3e
> 
> Best regards,
> -- 
> Kuen-Han Tsai <khtsai@google.com>
> 


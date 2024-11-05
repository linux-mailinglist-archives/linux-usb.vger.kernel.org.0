Return-Path: <linux-usb+bounces-17132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 569079BD262
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 17:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 880AA1C2140D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 16:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAAD1D90A4;
	Tue,  5 Nov 2024 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NWpQZj7t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF848153803
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730824316; cv=none; b=UY2Gdwi0szIuJV0Yq5am0KELj4lxM6r830CLAOqv8yL507hSjAA9JRScluaI6f7abgUjFckHMmp+Xw4+vhqmvuLZDGrNxszkap719WTDFAxD3048p5vqDcUrR10YuFMxDYTWS9mJrgpG1MPqg4bhE/iGwbXacQr20rcSHYXW0fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730824316; c=relaxed/simple;
	bh=4d9v2cWuaRVGT14XWrISLQJliQRGtTMvXYyJY44L6ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a96PbnFmq9WVTiG4h0bqTDO+yq2/zLqjNJEupWCA6qVVo218j3igxtcFBcmAAKjyLDOMR/kvx9YvR58TItQTqoYSbQHWxPEhwkIzNYWAs13Arl0YW14OkEW3kv7T/SsaFCw30pHwvBA+tYnow/oTtXLTv8Ztxph4y4zskS4PW50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NWpQZj7t; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cbf340fccaso44643426d6.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2024 08:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730824313; x=1731429113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZo83BrAiQ9tG8XAHbhlF/IGbCc45iRSUdiOTPNnKCk=;
        b=NWpQZj7tJ9Pva3kRfOOc31IHp/6eXsZ7ZAN4KIzr8bOVFsjowXJtAzFVkudzsSVaWc
         i6yBbcuks0joyQ8lWVxmF+pDtDHmtRRhfhEXZ0lXEllR3sAh6wL6hy8/oKOFAuzIdnSg
         udtXh4npKmSOoZUifGjWwQqyLa42cj83lhGHI+ne0GUICOaP0Ox8f/dWZh6bOl17DIL6
         LlS9ZbOj7EwUWecDs0jQlb/b/yuXcpBpgRv0ysMFrCvu2xnCaiOBxcikk5F2+beDXq+d
         28ogRq4wyem0ISTQ0Kr4Dqpdl7/jnZVCBcUniuvyhheHdYLdtHnQeX+PBm9POCaoqn62
         TxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730824313; x=1731429113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZo83BrAiQ9tG8XAHbhlF/IGbCc45iRSUdiOTPNnKCk=;
        b=WvMoY99Qh4tmF4IP61VppZ6BsnKLe+4ocDsPLMZXYkTdCjPXR/XaBY2K5QNLG6h0Me
         Zdbslwa9DJmAWliqryHYuJWsrErrWA42QuwEvvuODuBKoCk3kevoSXekfrd2NlaTGmAO
         +Usd8I4WCBZi//CZvYMTsJmBE7/A7VUW43NvqdWkgVaPkbGiR9Y8sVT9PEhMjkRNRLun
         vFYNZ/8zlWi9mXJNGFhhg3o1xIakdcvsYPcsXw/6HI+bGow88llsbr8LvkriBJ9Ys7a8
         7d7IVDg7BqL0+Glsxv208Ha17jG+cVe/GKHWNY5v9FSUxCI4mxeX8NDBskW81lJr7EbJ
         860A==
X-Gm-Message-State: AOJu0YxynDbQ3ZVja7BweW+aogvhluWaNn5gbauHTy3McHhMXCFoHcP6
	MuwH0zG8JA4rIel6OWIzH2eSxHeE00U7aQaO7ftB4jqvcGaZ6i4qQlDvDuiAa6GlEwkhsb0TYee
	8AA==
X-Google-Smtp-Source: AGHT+IGkigEPQ+WEHxrr6kTA77/7ZwOCz3sbE3+hPy9U41Vt8WvuKJVYqNs8AGx4esdFX1IiRDJEtQ==
X-Received: by 2002:a05:6214:aca:b0:6cb:ee9c:7045 with SMTP id 6a1803df08f44-6d35b8e6c2amr276986036d6.2.1730824313630;
        Tue, 05 Nov 2024 08:31:53 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.12.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d353f9e7f7sm61904736d6.29.2024.11.05.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:31:53 -0800 (PST)
Date: Tue, 5 Nov 2024 11:31:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB warning on boot
Message-ID: <88368db2-f9f4-4ff0-a0e7-aa3b8bba0088@rowland.harvard.edu>
References: <20241025135649.2d08be87@hermes.local>
 <9b1343ee-2806-464c-a99c-5bae44985cc7@rowland.harvard.edu>
 <20241025152340.35be2607@hermes.local>
 <9d973212-fabe-43b3-bc3b-4a5c0632c230@rowland.harvard.edu>
 <20241104205323.364bc684@hermes.local>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104205323.364bc684@hermes.local>

On Mon, Nov 04, 2024 at 08:53:23PM -0800, Stephen Hemminger wrote:
> On Fri, 25 Oct 2024 22:23:54 -0400
> Alan Stern <stern@rowland.harvard.edu> wrote:
> > Nevertheless, even a malfunctioning device shouldn't provoke the
> > kernel into a WARNING like you got.  The underlying reason for it is
> > not at all clear, particularly since you didn't enable usbcore dynamic
> > debugging -- although that might not provide enough information either.
> > 
> > One thing you could try doing is simply to replace that hub.
> > 
> > Alan Stern
> 
> Replaced the hub with a similar one which probably has same chip inside,
> and the same problem happens. Which kernel cmdline parameter would enable
> the debug you want.

	dyndbg="module usbcore =p"

However, I'm far from certain that this will be very helpful.  :-(

Alan Stern


Return-Path: <linux-usb+bounces-30868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8FC80FCC
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 15:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A058345CF0
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 14:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D780930F7F1;
	Mon, 24 Nov 2025 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRdOdP48"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600223043BD
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994310; cv=none; b=WJKzsQVGBRLxSNfKtfjDIET9cFDBtE6hfYF3Bok8xRJLCoHbyQuLPGwMQdYhkord2ML39+Rc10QXhAtfrHMwxdVmB7dAZyUPsbxAr0dOTpZoVmeXLAzu03o45dVVA0r6Kw2vuOfYrjkfsm4dLmSRwO+Q8B4erjws9m+KOPXYbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994310; c=relaxed/simple;
	bh=eO07VQEwgqSfynp1qqdufNtqE/l1gHcgbWWeB+OT45I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUcUVOamUp/8mpPz537htC0HFLqC9lcsc1KPwPNTy1nxP76FhmtgcBKeBMoNcI84PbHGfHfQCmSJJho0HVH2vhkEBHJD67eRnDVRu4pyWXnLydLs3zh5uGEmQF/RvpIooPkdgsRoIG6h5JCGjnWPiASXknGnvLuYc6c6Qh/GClo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRdOdP48; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b31c610fcso3766977f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763994306; x=1764599106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae8T0Z9s4xBOOpN+XeFPZD9BWqfqP1d4jFrRORxUC1o=;
        b=iRdOdP48VZ6q8bRopKZH9axVkbCAUd+NjNeMfbxbWozNpUefAgQ9K7/axboE/FYOAi
         vW2s4E4FyTLdYBaqn7j4QiiuPo7rwAaiFl+418f8tiB0fPlaLho8CnEDzMVxl+oI7n5Y
         nPB9M6Wcjatn5zXmOgOPBk6vrgDSSP6IKbbJ+qBI2vZ/n3nQIJyyEO0ya7nIGHVUkia3
         tNuXlFnZotFqdeF56kq5wBXEfBGig6DCToieHJKirINv+JTnHyZffjPDK1QRyiSp4E8N
         4XPdZ9pLPn6UIJmFOxHsinb8botCsE8yUNi45fonyyHWnW+m9e9vjZylfLKQrfOIMOEj
         PTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994306; x=1764599106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae8T0Z9s4xBOOpN+XeFPZD9BWqfqP1d4jFrRORxUC1o=;
        b=bpWxKAmktHuGZ/5WPu857Tua4RJpIfA6ZZ0gCD3UZf1Nl+mqafBD6F1UhkUqULg02y
         H0N3O0CvX97C4PoKHCYVwWV21jpv/dkGrbAFX440rf5hNbtHu/HTUqX5AVYuvEkMlkhh
         Ah1KpNgvLHvaJfRUjtJnd1yjWcVbMjpnTPg+174z62jzaJkeeOvmcgs8gnsRT5Xd9ks1
         3ZgQ6xzK74wo/5bhiWazxBfcopYIRKmOPKdvmWnGrpRGThWrWJGPMrLnaYe+PYKS3WuN
         SZqklYJwfvWetcKKVgt7dDpQxdIkRYmbmsP6jo8rVka0yINXixWw1pPVlA5WhwpwLhkl
         NSmA==
X-Forwarded-Encrypted: i=1; AJvYcCUSjXawv0Htqrn0VoMAeWFfF56mk3IkdYdFcPT/L2dN5t1exxrffLvRnRN2ka/3wlT3fo2S7KFeX7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMa8vqPeGkDiUwk/OX69aOVrWAGBqeGLhxzoQSfCccUpO3Im5
	7lW8i/9LtbX5DV++CAdZ5mQPh8ueaiRYRZq1Pqa2gXAcg7RTudJbWtP7ajnV4N0wlWo=
X-Gm-Gg: ASbGncsUp1AXG+yggd2Qnc1dLgQd6HYFHS42/pCdshNYsZNzJsdU4Khv8ew0WC+0VeO
	5IzNtK9xsJe5EJeuXK6NmU54Ute/9CsC0WCZFqW6GyH9wBSUWb02PuFOZnycWARRo5FxcuyY5Nk
	gJRDt895dlvptbeZZxZ0/Iil7IL1L4Bk8WL2Qd7wlUdrFOD0NB2CJoIkUgxfeugHV5xWcels1L7
	5bkDaLU6gyBIjySiVVHuW3R5Dg4BoJN3uU/PpIPvIPgWHUrH3we47779eLnWK+OAALq0o8EtBPh
	nu0EpmvbUHr/Y2k0d92sQepI2gPkieInUrCc+Cq2ObKzSM4Xm58lFifC7beBIxjsaUWspk3f43o
	p6Uhanx1q6itjBeTDs0CgJS/gRh7AFvbVgmvGrjlFKrFQobTn+jdmBr1qNXQifGylVdvJogkTdL
	hqobdsEXE=
X-Google-Smtp-Source: AGHT+IECxhv9+1ZGZEYdbHolWeNHq8FMXodd47D6FbZd+PU/x7ZCehXLWBv/uH8jYsOdYwVYwArfyw==
X-Received: by 2002:a5d:5e01:0:b0:425:742e:7823 with SMTP id ffacd0b85a97d-42cc1ac9401mr13013463f8f.12.1763994305318;
        Mon, 24 Nov 2025 06:25:05 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35c2sm27493166f8f.25.2025.11.24.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:25:04 -0800 (PST)
Date: Mon, 24 Nov 2025 16:25:02 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	"Christian A. Ehrhardt" <lk@c--e.de>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] usb: typec: Expose alternate mode priority via
 sysfs
Message-ID: <h2e7a3xkss5zkjuk4jtuadx7uudt3rl6xssbmz7tgagw7idbhm@jnv2idvv3hbf>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-5-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-5-akuchynski@chromium.org>

On 25-11-24 12:46:39, Andrei Kuchynski wrote:
> This patch introduces a priority sysfs attribute to the USB Type-C

Please read submitting patches doc. No "This patch ..." stuff.

The rest of the patch looks OK.

> alternate mode port interface. This new attribute allows user-space to
> configure the numeric priority of alternate modes managing their preferred
> order of operation. If a new priority value conflicts with an existing
> mode's priority, the priorities of the conflicting mode and all subsequent
> modes are automatically incremented to ensure uniqueness.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>



Return-Path: <linux-usb+bounces-25241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9509AECCE6
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 15:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCAF4189682E
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 13:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB1522259B;
	Sun, 29 Jun 2025 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CZDfRdZN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B36C78F2E
	for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751204018; cv=none; b=ZnAbg9MiRPRkkYEMM/y64CKnJHqe83gSu8+/fnw6kwkXnS2qTlX2guImRgqdEvaKNQl5uG4O3EcVQggkCieLviUfebgmBtZPHujXAvljinmx6x7owVzJCW8bcTEpQ9D0Ahw0SrEa5tpwiQ4SJURAPloShah7hASTsMPxpdqElSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751204018; c=relaxed/simple;
	bh=Im7fHsFArK/1tFdJMR16F4bXojfNIYbHDtzJEM1VqZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJ7AONfyLutXnWT5QRHzG9bE2b0gshQo+ZLb8ENJBIidlhGUT/ykdlv9NjhdIjGWuJFw6a1TApNaIcu4eb8TVvY2oQ5lt+3tCv26z6posC2+Kx2dBwUe/SUkOdQjkLyvsURWYgAEwhY2pcCrUAXPLfdNvZXcHlWTKNahVjQ1nUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CZDfRdZN; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a43d2d5569so18060431cf.0
        for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751204015; x=1751808815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Embj1Fy2DJouvQ91VRCrgqeiZxMI64cyuUrY1sXvYvw=;
        b=CZDfRdZN2A95SQSZVsuAWImwF9/7gR81ahHop1sadT9ha3dUnRuwtpmrnJan4lPVTC
         IhtNNYjK33ERpEIQPzMmBivYpRQKR/BTz/oPWrwgY7OBdFSYHCqv8TItTUpFa0GbeqSN
         2WyAX7suNJYmo6adFrrjDw1VZtC/QDsrTtRV1Q3SU1e539hKMOvqz8PAqOZjUz1gtiXA
         ALhhyhzi7J56IMwFh2mLqxXc/UP3QGTFskj3vk6vvIIaeVRGZ638y47AUzHtSY971eAA
         weIWs6HFf6Z8qddhn4YgYzrxt5Vj3pdil/AxJJhCRPciAHx+53k72tdAA8DSAqPpCERM
         wdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751204015; x=1751808815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Embj1Fy2DJouvQ91VRCrgqeiZxMI64cyuUrY1sXvYvw=;
        b=tCZph5ZGGdb/zb+f7fuu4zlxDlJjotYmPdz+45xneHNWcdyHx4YcarS9eWOhYHc1vA
         lh3LxmZcnWOUl14XhZeBKA4n81IZ0tt+EevZioo8L8vfyAdLVVVWlL65quXcEKtSV6/y
         zQ4X1tc2+muP2TOrT/UoPdD3nS90BuSHB+SfpQ1VVXT8dkKzKTko/ASPJyXcsl6MZox1
         FRKZEv4n+Mt+XfA5ziWfIq6ptIwN1QkmhjTrElmT0BKYMhSeCh1tlz+NkhL0yue4qf1+
         W8dJHIkZh7yVB/9qYOrLqOJLzZ/jwvhpbGvgttrzO+G0ixu/M+rSaVYElUcl7iC0MfYi
         u84A==
X-Forwarded-Encrypted: i=1; AJvYcCXqyVMsU2s2Cng7fgjCTAVoExXKkvXF4x7jsGhLTyuhTlc8js+eTUvBhlOub56nBvpjxdtXsEf3O10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3uMsO9GbqS+p2JI7K1AH4UwzpA4ZaXPptZPOsOiuhmvABWr0b
	WC1cA58G0uDOW78v0jMRXDZp3C1JNV1jZZqnuTMe1d/Rsvdrf7GEMrZTdRGSZBgRzA==
X-Gm-Gg: ASbGncs5LOF4ldSH1PwJguiWbKwjyyjafUXknd1lZYXRrwxPnqF3j+8ibyUeRJpoVlb
	1cNue/NiEO2qJWHzPm4TXK5FEgkezQ7XvGli8AuBfxArG8G1Pki0Jkzej5BlgAVOFkyXBTwCppa
	+g0OKIYlWvoHyWTI9KdJNEz+B4g5YVJCJ8Lvv4HG/TYf0kK7pJD6mAH+Can4rZtLoNhfGIJhpel
	qCyQiDi3gEn8zYCzDQ7vBkhEDTnXn0X8VNeInIrlz75DC+vMJeG6UpNOTDBYZdiHfRH0pRnIIXO
	eno9VyPem8xxxRIdoZNviKnQdmMUs9sAbP3GBAMwLD6UUnZbU8uJVn4+65MyOGY=
X-Google-Smtp-Source: AGHT+IFkWV3qQJluABPlEDQqfcYO9N9MbOOl5fdQgXXCIVkXvMlt7C0IXV6g9l8Mna1o+i4IA+YrEg==
X-Received: by 2002:a05:622a:2c9:b0:4a4:2d64:a7e4 with SMTP id d75a77b69052e-4a7fcaeecc0mr172064861cf.35.1751204015252;
        Sun, 29 Jun 2025 06:33:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::76d8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5a3b92sm42853481cf.76.2025.06.29.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:33:34 -0700 (PDT)
Date: Sun, 29 Jun 2025 09:33:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Seungjin Bae <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: m66592-udc: Ignore feature requests for EP0
Message-ID: <cca54de8-db74-4df0-abfa-7275f8f2a8ac@rowland.harvard.edu>
References: <20250629025951.17581-3-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629025951.17581-3-eeodqql09@gmail.com>

On Sat, Jun 28, 2025 at 10:59:53PM -0400, Seungjin Bae wrote:
> The `set_feature() and clear_feature() functions handle requests to set or clear the ENDPOINT_HALT feature.
> Currently, these requests are processed for any endpoint, including the control endpoint (EP0).
> 
> The ENDPOINT_HALT feature is not defined for control endpoints according to the USB specification 9.4.5.

Actually that's not correct.  What the spec says is:

	It is neither required nor recommended that the Halt feature be 
	implemented for the Default Control Pipe. However, devices may 
	set the Halt feature of the Default Control Pipe in order to 
	reflect a functional error condition. If the feature is set to 
	one, the device will return STALL in the Data and Status stages 
	of each standard request to the pipe except GetStatus(), 
	SetFeature(), and ClearFeature() requests. The device need not 
	return STALL for class-specific and vendor-specific requests.

Thus, it is valid for devices to support the ENDPOINT_HALT feature for 
control endpoints.

Alan Stern


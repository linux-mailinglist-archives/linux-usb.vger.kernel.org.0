Return-Path: <linux-usb+bounces-9263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4130B8A1566
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 15:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6421C219AB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 13:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FC714A60F;
	Thu, 11 Apr 2024 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKlvk86K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFD71EB26
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712841630; cv=none; b=Jxr/IGF6PazkmegftnuiiPsTFQ9Bci6EXl60zLKGQSI5KSOyDL/fdgzy+7zz+seBNMXpaVIsDeii1aIAiB39cJp+NXojEJbWOTJWCrCr59rSbNkbUuEtOCcBrDc6vjBjyBFVkyROJXCzoP1nQDyHaSrr0E3TcP1XosDd3b3+r+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712841630; c=relaxed/simple;
	bh=8au3oQJ858ItFh+zdIxrBMOfM2TfZ9/8pgF19vMlTjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/1/j4Ixbxy1b9IQ2O5pNbj5iNdM9+UewTWLlOUWGLWkCb3wSHhTY5Oho2THwf+BYDnPXzIFFvol+PjEABYUjVSGq+Vo2T1GxD4deX+1o23gADII8Z147J0ba/92ZXlnKzywMNJWr9rLizXHdOLsHtBwalP3mzwy4SWkVUH9QYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKlvk86K; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56e2ac1c16aso8223784a12.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712841627; x=1713446427; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzR5shJg8wxSKtkVGP/DnnOPVxnHo+i1v7EiJkPittA=;
        b=oKlvk86KaTJyqAOYMfkJMLh4qSfRza36xhV590YyXuMDr5AU9SAIbgb274odlsWaiH
         HRgHnTVOeBM1g5xHrDVOdYTjUrr24OFGEC+RiqUUhp2PwTTI6nhmtWy40u1C1dEOq+lj
         wH70Xa2+F/IXmR8+qENcQfm2oQm+ZH4zV2VWl2ONqc+iTVHF5iCmEeLdm5XVTgwUBsA0
         qP/kI3wCpZk/7r06G+tMayFRX1uTo0PE8FdfX7POn8xWrNib2PMoqX1IQt938dM9vvS1
         hLE18bbUGVYj/MHL3aQe578Gu4W/pj6WetKPeeVGhwUjuEf8I2wr7M1ozHmWnZeP5fqv
         PH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712841627; x=1713446427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzR5shJg8wxSKtkVGP/DnnOPVxnHo+i1v7EiJkPittA=;
        b=IfUfu8c+j8OsCJizIGEo4DPX+rg65g7aEKTU5c1QV6S2MmAuEQrV+YSUO/NqV36jVJ
         FU85TORZnenqOcFr83njl8Bnf9RPwkZIwubGX+disznrWBJwjcNKkXfEE9E5X7jtbUwt
         Fw6s0XALDLYMyPqqhnv4zhNMG3gtp/U5tuQ2izvImZNDAoX6eYEOPRoKGl1v6k05cAS1
         +zKg0SNEPIjPSGxpNQyDBlR+86ps7m7bwCI1O4/V9LWHtK/cNQ2jl5D2tOyZKl5rR9en
         vZJiHVbd+kJionHwCClQQoDG1jPPZ2LbVoeOAxUm45/MbaRdNn4PPyFghl7I+ttZfCxr
         I3bw==
X-Gm-Message-State: AOJu0Yz5GFs8lZcAmyQwnOUgDSxlArbbLYPINuZoPrUAdcJbppMqOme1
	4HmNJlt5l0qKBSIrKIsgqkIHc80bL8NjNQB1+EJ8d1BScJat32s/m6QV2ETaXry6PgTPVa8eDsF
	S
X-Google-Smtp-Source: AGHT+IHfMdJGmev72k1C5rzR4el32LWz0YeoBWqQaEgEKo6aiwWetGTpSnb3TjKcYnPg9iMNL0jxeA==
X-Received: by 2002:a50:bb07:0:b0:56e:6aa:c7c4 with SMTP id y7-20020a50bb07000000b0056e06aac7c4mr3429935ede.42.1712841626994;
        Thu, 11 Apr 2024 06:20:26 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v19-20020aa7d653000000b0056fd85df9ccsm695052edr.47.2024.04.11.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 06:20:26 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:20:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dmitry.baryshkov@linaro.org
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: ucsi: extract code to read PD caps
Message-ID: <a3a2799c-04b3-4b8a-b808-5a118b330619@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dmitry Baryshkov,

Commit ad4bc68bef3e ("usb: typec: ucsi: extract code to read PD
caps") from Mar 29, 2024 (linux-next), leads to the following Smatch
static checker warning:

	drivers/usb/typec/ucsi/ucsi.c:689 ucsi_get_pd_caps()
	warn: passing zero to 'ERR_PTR'

drivers/usb/typec/ucsi/ucsi.c
    680 static struct usb_power_delivery_capabilities *ucsi_get_pd_caps(struct ucsi_connector *con,
    681                                                                 enum typec_role role,
    682                                                                 bool is_partner)
    683 {
    684         struct usb_power_delivery_capabilities_desc pd_caps;
    685         int ret;
    686 
    687         ret = ucsi_get_pdos(con, role, is_partner, pd_caps.pdo);
    688         if (ret <= 0)
--> 689                 return ERR_PTR(ret);

This is returns NULL if ucsi_get_pdos() returns zero.  It's really hard
to say if this is intentional or not...  Originally, we treated error
codes and zero the same but we didn't report errors back to the user,
the code just continued silently.  Now it's reporting errors but just
continuing along if ucsi_get_pdos() returns zero.

My instinct says that we should modify ucsi_get_pdos() to not return
zero but I don't know the code...

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 8abde8db6bcf..427b7610a074 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -650,6 +650,8 @@ static int ucsi_get_pdos(struct ucsi_connector *con, enum typec_role role,
 		return ret;
 
 	num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
+	if (num_pdos == 0)
+		return -EINVAL;
 	if (num_pdos < UCSI_MAX_PDOS)
 		return num_pdos;
 
Or, if returning NULL is intentional then it would be nice to add a
comment.

    690 
    691         if (ret < PDO_MAX_OBJECTS)
    692                 pd_caps.pdo[ret] = 0;
    693 
    694         pd_caps.role = role;
    695 
    696         return usb_power_delivery_register_capabilities(is_partner ? con->partner_pd : con->pd,
    697                                                         &pd_caps);
    698 }

regards,
dan carpenter


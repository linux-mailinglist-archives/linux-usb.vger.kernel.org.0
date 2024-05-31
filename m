Return-Path: <linux-usb+bounces-10731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9F8D69EA
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 21:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1049C286315
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 19:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39C217CA1D;
	Fri, 31 May 2024 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lDKkiDb7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B54F811E2
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717184454; cv=none; b=QLTnj2KdieibW/9TszZqLrEJbHYaXTgdoGvZs6Gzyxj1C4POUekMm+SBRp4HH16N6NtfhmRarj6P0rK3ZV0B+NryPVMW8JCOpAnsGQcBPNRe4YNnI+7+M188nYGYWqTECtlLTFeOSfVme/miKRyeaLtfORKSlPxNBgQ5WzLYOp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717184454; c=relaxed/simple;
	bh=TQ2RL+BL2PmNJRXo1hXLGtYA+NaoDx0hkQ6nkL/9K40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwzAhfBbZoLqGM7qljFD2vZq3rlgM9Tq18Ot6g6z1Of/jgv6c0R/iZeytf8v/vUsuO8AknO5UlxHXL/LfMNGDecMHAw35dUlli9LMRMrxXOS7kbxyHvdQpAGvrFvXX8JbCgkTCYXs9NluKFPWc3Gk1K7yklUdn6aDWzmVgkv0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lDKkiDb7; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so31957921fa.0
        for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 12:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717184450; x=1717789250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvFwjLMrTRmtQ0CyySB6yu7xfec87gsowa4Zls3ODKM=;
        b=lDKkiDb7TFPiiMtPqbjGPlxAgXYPWl4Vse131hU4XtWJKNDJF8YeEwBy0n9O0LfIsT
         Cb8XBx+vacWGSiMORc7EQPwLn+qx/w1X2qNRBnsICoayMZ16NzMk0TMZvk+FUWCROsKG
         O+N4cT5MU/cyloR2KJgpQop4d++9Grcu3ft6bFMVAsrfls5Nq/p7OPpyEQyW++9mma/9
         aWg178++QZfNqE40w7KpA/cpIolDNcpsdA0VJSskOU4LI5d7UCexfg+bCLkgpxxHnxpu
         te8/K+vwMqBcDEcXy4oCX4BLkzfQsC0rM1ekV5rY9Slk9DB3DC/G/3FIcTrTFOWLc+7J
         60MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717184450; x=1717789250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvFwjLMrTRmtQ0CyySB6yu7xfec87gsowa4Zls3ODKM=;
        b=sjY08bKIzdLm4eld2Fp/h+TawOscM9VcsbLnLEmC6houSVuPdtmmz9vm/96R/richv
         eRhMXt/NiOZyiF660DTSO8FA503TOHgrzvbBJutjs4cLPMids0d+c1HqRy0EZl986Pg2
         ZXp8/YXup01gdB2n4aZgU7VdjHR8YQnaNU05KYjMHlLeR+ZTRih4/wtO0xvha6tXKNii
         PmtBm6nIWEowd6oK22srDg+08Xxq6jW5cU/Unp9aHKqSGF3Qva6499gJUngR0Uwi8Lu6
         HvMze8BrJSHvG4B2H52r98/WA7fNts7A+Y32GG+81TL7ArfMMUAA586lDJ63emcKhnFv
         Cn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0m+jLBcCbRrVYdZxKO+jSGGMN0SssPBNgo2HL0MC95jC2W1WC0uWzFmoj8IMgq3O8vwJsBh7FHiIXEGj97D3+Z8ibWL/yFzoB
X-Gm-Message-State: AOJu0YzjmEo2NDjlgDW1ZxM5nbHw2V0FcRQUUjJw0lB8De4JdwP6wX1R
	8F1uXEqfVOig//akJpQrUfivuJCdUt6A4ihf8g52aBdzuIJIIExQswm8Cq3V3RA=
X-Google-Smtp-Source: AGHT+IGSW17YxQLGQcUtlueslBoXW2uqO2r4S2Ky+nB8dMPnIdoeiclzSW2U28EBqOsG+qkcNlvxOQ==
X-Received: by 2002:a05:6512:2084:b0:52b:8411:20e5 with SMTP id 2adb3069b0e04-52b89572e9bmr1889709e87.15.1717184450399;
        Fri, 31 May 2024 12:40:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7ebdesm419366e87.185.2024.05.31.12.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:40:49 -0700 (PDT)
Date: Fri, 31 May 2024 22:40:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 1/4] usb: typec: ucsi: Fix null pointer dereference in
 trace
Message-ID: <m4ycprnxwq7gfdpm7prbw5f6djxqzzkrwoxmghuoifaqfvu6ky@z66esyhxouzu>
References: <20240510201244.2968152-1-jthies@google.com>
 <20240510201244.2968152-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510201244.2968152-2-jthies@google.com>

On Fri, May 10, 2024 at 08:12:41PM +0000, Jameson Thies wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> ucsi_register_altmode checks IS_ERR for the alt pointer and treats
> NULL as valid. When CONFIG_TYPEC_DP_ALTMODE is not enabled,
> ucsi_register_displayport returns NULL which causes a NULL pointer
> dereference in trace. Rather than return NULL, call
> typec_port_register_altmode to register DisplayPort alternate mode
> as a non-controllable mode when CONFIG_TYPEC_DP_ALTMODE is not enabled.
> 
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


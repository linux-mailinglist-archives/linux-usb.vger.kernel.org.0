Return-Path: <linux-usb+bounces-6941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB2860A4C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 06:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D4B31F21B75
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 05:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B8011CBF;
	Fri, 23 Feb 2024 05:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tr/za4bY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3E311CB2
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 05:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708666672; cv=none; b=DaLJxcGnDwLPaQUruTGCA8OaNbVSYT/wziqeHPFpIaMlz+YBZe0gvZ9YP0y6RyGTtIMfgRrUm+XehE88XPP9NLuFZaoflDxPgfj1Nk+o+R9QyYIic36AiTy2W2NXjA0fZjWXuAhA4Xq8GFuz91xIaVQGXPTqYxVoqhdNx+iAjI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708666672; c=relaxed/simple;
	bh=xsKSwLBBIARsj04+9pfUA2veziCGU0ghHiZxG7VQXh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9UABZOtxGf+EDUUqk20qX490ugGue/dr1vsj3AumphtQb9zX/reE/Yn9uQNjMXCPODWH3pyTbaAkJlOIv+dlTG0N/cw/7X8nBTAuXw8o95YdqGTbQC3AbNWH8a5an5fPk8oZv0dijwFlaOMeH0sTgk+CnELW0aRNFYms2kA7ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tr/za4bY; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso486964276.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 21:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708666670; x=1709271470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=piy9E/Wi6hWu5zacOupA8Uhn9Hcy3zaRnPaPm0Ffstg=;
        b=tr/za4bYqPdXEzQgSb8MAEKZMUNJM+rRDCGzFwDvy8zq6tQsLmJOMqH/BMzI4QLfXC
         CoS0g9of08hJAY10QSDHeWBnze/HG9BiosShLEtkVuHwA35dLqRfEcOE9ClvXTeLwzhU
         a+IeDIhQuk40l68F58hKRz1la+lnRxNifERZEkAbyqLlm0eMFEEHcddBCc17u9eU45IQ
         +kJPXh6HgtDpQr/HahWX57V+jToUhsBZI0XIu28i2eopH/FBH0dJ6aTFV0PY2gfW880F
         +l3EKfq62SXlzTyE8yoqVmKO6mNZFASeQRksL5vn4jTNZLjY+YPIIqyK3JoXz/qM3WuK
         GCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708666670; x=1709271470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piy9E/Wi6hWu5zacOupA8Uhn9Hcy3zaRnPaPm0Ffstg=;
        b=Isl0cjIhLtd7DTFg5LiDXEg/R4+LLL44H9AkdZZZOLw5M97eUjFtTnTmcNz+5FI3F3
         dD90RrPBukp8yvz10FhHk+OUfTlrUhKs8SRUY1AR2Go2XlWOVAdZzcpmrVFGoq0mbeim
         IEbcHyzpt3G2+f/YM2uRvFe56JVLvzsmPRFyaeJvsFeL6je0k8AsZzIyZ1ZDBew2R77V
         mhtx8tArzkUg1LfVrv0oV+MBZBgzosozAMiEOz2+eUmtlGSnNPl0sY9LEqvHC+pXwNbE
         +K1oFe/wvnvZmEbbZfjdBvv+C4BrpN2YpZ73Xq1wmtny+iVN2ODwT1cADuNCBPas79Z+
         qnjw==
X-Forwarded-Encrypted: i=1; AJvYcCWm6XkiAYMSwvlnlwvwivS43MdIV0MCxtxRQ3mIJsXsiLpDKKiXyjKUDpfoJOYA1Oly+0jqPcLSTu/mjydhj/U2FV46o6m3Yof0
X-Gm-Message-State: AOJu0YyJ6oOItTr9Q3yct8zeRU8Aqsw+Ght2Ta22zbmt4asIvBg6Q8gz
	6wNboX8gYB7gZ4Y7EGHBZ/VVzKZ5fxXs8N4JwzICubeLQsGcxhVHzeuW9QgxO9S8RoC+suG32MJ
	8Gb2QhmeJ3jsNDL2lKMdALNTw4yWi6CqQ6Wp5OQ==
X-Google-Smtp-Source: AGHT+IHowG1djzWv8SQ+TQj50M+pnuS5txwPBX/b0kYHXIda9do+3n7ow8oYi6E8ViwH5610dsWdNg1YzjYmgmrbRSg=
X-Received: by 2002:a25:4e56:0:b0:dc7:4bab:c390 with SMTP id
 c83-20020a254e56000000b00dc74babc390mr1041815ybb.61.1708666670011; Thu, 22
 Feb 2024 21:37:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-2-jthies@google.com>
In-Reply-To: <20240223010328.2826774-2-jthies@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 07:37:38 +0200
Message-ID: <CAA8EJpo_n6Fts0AAKW-C3HGArnuxxO8xF6he7b7j9y0e9CTYpg@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 03:04, Jameson Thies <jthies@google.com> wrote:
>
> Clean up UCSI_CABLE_PROP macros by fixing a bitmask shifting error for
> plug type and updating the modal support macro for consistent naming.
>
> Fixes: 3cf657f07918 ("usb: typec: ucsi: Remove all bit-fields")
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Tested by building v6.6 kernel.
>
>  drivers/usb/typec/ucsi/ucsi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


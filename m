Return-Path: <linux-usb+bounces-7098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17282867F7A
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 19:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19EA81C2B608
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 18:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E228712EBE9;
	Mon, 26 Feb 2024 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ixYUk7FY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C512B167
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708970540; cv=none; b=XIhVOiBOKwXiOaWo8iSKeRY1Fo6zZnQD+YXeN+fYoUVhKn4s6oQM/2CjyTT2mKInDY0pWMM6ws8rE1nMg6OKKFjRP+ZQDF9quqTOSjsdYqHeztf2U/6T045r1L5p0wWubi/QhcIUYn+4OH4BNxIGuIbkE/Tjz0GKq6hysIKRGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708970540; c=relaxed/simple;
	bh=hdr4ZbnEXODijpEDky8ouwQnYopzGBrjVTpACJDh7fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aj1NJEZiPqB2JL7GR1psI5krshPVBXwvNlB8igeC+R/vchidHLkyDsPbYWvQRSW7CruIbVFKNY9X7bjr1uBmYgKG1L8q/ROnpfYHJsxOP9LCN/aHmemrzlCTj7JaDFMZj7yQalsoIrEZxkcv16Wp5Z6ZGdzEiV7Jv2n009FHrJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ixYUk7FY; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-68f5cdca7a3so22383376d6.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 10:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708970538; x=1709575338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdr4ZbnEXODijpEDky8ouwQnYopzGBrjVTpACJDh7fM=;
        b=ixYUk7FYdZ8OiCgCX0e2XUUDTyiArkdseQyeLTPB7MDhh5bsZbdtCWgDuUzcP6Kjz1
         NJf4SzQw9RkqZ8KyfCGVxYjR0bBQISqTsGNqz3LWqCBy5O08WtpXg/1M58SS9iwGQZsi
         yhN2w1Up31IeN7joAOKefE19LSBrcCtd3AEfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708970538; x=1709575338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdr4ZbnEXODijpEDky8ouwQnYopzGBrjVTpACJDh7fM=;
        b=PZtB4FZveDALt0r3WTSY9d7Ehe1EhXOq6mVpGhLt62tWNxtSyIymeGrLJcBbf5DmNy
         XQFo45nantGVDQjsTTW9Gtra4D7k+JJXXtvcxSp/fBajFJNxCXOy4fZaZk1IbLcNWvnJ
         XKYf0PvEBbQog9eali06+11xJ40E8CKjbA5xSeHsy8N2O6aYiCautc4/m89ZPmT/jcme
         KfM1tkNt6YTXNP74w8Bq/v5hCAekHjvs66IF7CQaNTgXnY3RGhNbam7y2yzJJtlS2FIN
         10DbWjPaLtLbkBeISrqlwIbmeb+WIAvtRvSipwTa/Xvd4h5Izq4yRkY5AphE+WDkPXZU
         HbgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgVapW0xsN3W3ekEW7FJjvem00AaSvWScWZwA12A3ZEh5KqzgmXCNiA4ENblhnPMxJdJ7YFoteaKB0r3JD5kwDz/QZFyT+6/fr
X-Gm-Message-State: AOJu0Yx4oyR+Spkak5sNn4LebcRM4KW8xL8WF/L2j5AhjguynRq+PPTR
	WE+d0dKEfp0CFyn7ZuI3a6U8/WIWnqp4UQytIJsBOPvsvNVfPUZyPI8VXGQicTWn7604HcYTxlS
	OH+bE6cV6AtLwiN+8hJ4X9SXc+fmOj1lfKL2D
X-Google-Smtp-Source: AGHT+IEV9P9k8lXpLuRloExNgbCIESKZHzR9wiRiMPX2/PLjCV6iI5UxsSI6ALNh2KaP1n8qdbRYs7YdyqwimjOC9Ck=
X-Received: by 2002:ad4:5962:0:b0:68f:ff45:8793 with SMTP id
 eq2-20020ad45962000000b0068fff458793mr6601047qvb.25.1708970538049; Mon, 26
 Feb 2024 10:02:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-4-jthies@google.com>
In-Reply-To: <20240223010328.2826774-4-jthies@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 26 Feb 2024 10:02:06 -0800
Message-ID: <CACeCKacHYxdvdzaRxRMREeXWfbunhSy-3q+sSKHbJ+u9XXQukQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:04=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
>
> Register SOP and SOP' Discover Identity responses with the USB Type-C
> Connector Class as partner and cable identities, respectively. Discover
> Identity responses are requested from the PPM using the GET_PD_MESSAGE
> UCSI command.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
I've reviewed this internally already [1], and it looks good to me:

Reviewed-by: Prashant Malani <pmalani@chromium.org>

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/5260256


Return-Path: <linux-usb+bounces-7111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E436868519
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 01:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BF64285BAF
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 00:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1E01849;
	Tue, 27 Feb 2024 00:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qYYuNqNG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B2136A
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 00:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708994662; cv=none; b=CvBUDzK1zfC5lMGQcHakqTU3iTkg+UDTvR71gOf87Cd4R0TH12vELFJopwEzLKcyOs4OinTohw6l2Xo16fx/5+cXHN2i1xpreACZQXRIEPdtY3VGKIzaUpv0uHDQaAUo4EYs0+ujLhg0olKC7hoA3HTPslxueZ57uznZOTwTbTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708994662; c=relaxed/simple;
	bh=gSk0jPbGl+HjDshv3rSpDXIHqKc8HJrNcPn2WG1YEoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nz92hL0W603xPhyo1yGzczMY9NUAlkeZ55YFErrVv3VUVqziLSJ5zTEfGvayq3zF8ZBpZSOyPx63HkC9UKjH3ydQ0vSspipqjca++gxCwyBrnts33LsbY5I1vyyG5sRkHJxVsS2uNlRG8l3qkiKuqnCR8TxYQMMto5q7QQhUAYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qYYuNqNG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56619428c41so5076a12.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 16:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708994659; x=1709599459; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gSk0jPbGl+HjDshv3rSpDXIHqKc8HJrNcPn2WG1YEoI=;
        b=qYYuNqNGso48P+oF+/Ys+fBGPIcRCQQZwCtPjhdfXp7BnAIlYZrDwL7rhGwvx7LvYd
         nu5D6eePdWNE0eqJVgulQJxwFP7TCq9AuWbSocwa8hdyXJ8w1+L18aB5nuWqddM+2J6X
         g3tNpGUpgTAkZ4mXpYnZ7GqDwkEaBV1iccOeufUiQGtmzVV6Sg25f5FnLrgH+2IRU7Xq
         rBKm8IjkYyqXI16t48SkfW1UjWuTN/9EM+NnjrgF0fizpj3BtznLTyf7BeudqqaG+gE+
         1wP3CNs+2qJQV88sHARCNyRsUA1FTvqC+hhqoVEbFA3PUI6QwVMXVnPkOCPBFJJmpqVO
         +bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708994659; x=1709599459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSk0jPbGl+HjDshv3rSpDXIHqKc8HJrNcPn2WG1YEoI=;
        b=Qg+mXKneaDvMs+N/MGy5EV+hORe4CM/ItMHO5OBAulEDasVgyRUr0kYL4NLobx01Hk
         EcTo8tYPZqOBXzc6tBxI/kyaTHNFE5W1rhE9O8BdRb5bIFf+Ykr6CqDgJUuzTr2IYroO
         AhRFl0fFvDJg4Q85SlcY2ejzGTrw3E1ws755WCrOTF8eFe6CD3ahigoJUiA5JZWkCwEY
         q6Im2I9f1dOi0Rnn0cPC4S0SvBMleyiWizm6YCNutJUwVjv3Nr8VgGm3OdHYqpYZe8zb
         nPqtx363f0ADyfmV8HwdZr81DskyT7GkM3Yv9T0x7O3KrPMYdkrmb0nNG3Y2TXSW1B/g
         oFmw==
X-Gm-Message-State: AOJu0YxYwDZE9V7OffJE4nK5RH2pJLANQj7V2ZX9+M98GnmkXyq007Xm
	AmIfvgeER9y0zkK/QLUlKKTNBmXly0G/I2Ap+LYhvm2FuILQrxxkvZ4VS7QGBtSPOC8iBEc0pmn
	zWXuVuG4A61wBvE8B/f86zozkYQgKPnMWppgEHX7M1vvtwyZnX++qAv4=
X-Google-Smtp-Source: AGHT+IH0TGhvLEaxXJan8b1HSughaTUqrXuvQfnsKfMFkcgQyIrRkMMYBuRXm+SaXFlfzJtvf3G/sVUgzyttCL1astY=
X-Received: by 2002:a50:9e2a:0:b0:565:4c2a:c9b6 with SMTP id
 z39-20020a509e2a000000b005654c2ac9b6mr123760ede.0.1708994659218; Mon, 26 Feb
 2024 16:44:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-5-jthies@google.com>
 <ZdxU3dB2/GVlxWFe@kuha.fi.intel.com>
In-Reply-To: <ZdxU3dB2/GVlxWFe@kuha.fi.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 26 Feb 2024 16:44:07 -0800
Message-ID: <CAMFSARf0CSTeBQ0_4zbJJgRUmvKD9vPiObwOBMjj5fKTbtQWng@mail.gmail.com>
Subject: Re: [PATCH 4/4] usb: typec: ucsi: Register SOP' alternate modes with
 cable plug
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Is there a plan to do the same for the SOP Double Prime for advanced active
> cables with two plugs?

Hey Benson, I am not currently planning to add support for SOP double
prime discovery. I currently don't see how information about the second
plug would impact mode entry decisions. But, we could always follow up
and add that if we find a reason to.


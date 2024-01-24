Return-Path: <linux-usb+bounces-5485-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD36F83B17D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 19:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAB30B26DA4
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 18:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E45413175B;
	Wed, 24 Jan 2024 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K/VKxFaV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607A12F59B
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706122245; cv=none; b=Iyys6RYhui/LjxOi2PwldweT8+u+kAR/+6CyHpuWrUjKKvFaJNlbReXNLMILgH289x5EbBxKTXU0yijBosZcfHiVto0PjMTUyG7MnaGITyQ5WIOELmT2jErzFXn6J7aWYlSJeVmOvFBCKBXPFtQlV0buZF9hdUG+nGc2+NNU+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706122245; c=relaxed/simple;
	bh=8KUE5Ar4cZJiQdQdzub7Ie8v6YPuyRdfxDbasY7sD34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaivqH8bjkixT+oNNG8YbS1Bo16xZpz595SOMvJwWrh6nJwh8HslxUk9qDqoZ8fkGb9YbjA1pHr2WSfYHfONjukH151b6ciZid23hM3aLOHM5dBlQM3+AXm8aS9eNRwfXWLX3u409Ex7idR31FRnprYfQgz0gq9mn2EN6JHA6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K/VKxFaV; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6818f3cf006so31386066d6.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706122242; x=1706727042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KUE5Ar4cZJiQdQdzub7Ie8v6YPuyRdfxDbasY7sD34=;
        b=K/VKxFaV927A2W6w8W0zuoB+y2N8ThlE/w0UbJE6NbPwTLQLgyUFP2tkcamx0w99Xe
         v+JCgpZPq3s6i2Q7zYUiZX6/8DEjKu00mivB4ymYS5nQA/JX7a/xfp0lnN+sL07g5smL
         rN5cdG74vpcxg24of6Itr02QCBd17x/J9/88o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706122242; x=1706727042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KUE5Ar4cZJiQdQdzub7Ie8v6YPuyRdfxDbasY7sD34=;
        b=jcPC6xFzVb7DMzJpCpNN+1ZFM7B48xbwn4MyOkYshmEGCiYrTjgsD00EgJV5Zh/SXJ
         crlZnDh/vk07tDe8BqtGPPXgIon7BTfvIgsd+P30aA2E5kbpKtvPQdRU4LF9Nh2E9Ahx
         6C9vZJdLMvrQeHqI7I4oucf47uxaP258eApWtjD1FyD41MeDJmi0StkGkWI1zQGrk+xM
         T/E+tjpJD5uy6MlPIvrawNaf7NEeJQTa/BDukLPTqv4kyP7LgBM1guJmcuiV8s8+SFdM
         QeEe1X4iJDqHz7McVi9FAsUKai61CuglFB2QUJI84Hx9xKedXBW4MkVPn+Bcxru9hVzW
         9nCQ==
X-Gm-Message-State: AOJu0Yx+Z6hYyMtRxrOfVcRYSJQMrgrYMJuziqaiKPkRJZSml6r1ChC8
	UqLjnf0lHYOql6gmwNx1H+d2BnD9PKiB0JEbTWpy+1rfga4RfN1BwuMMwd11/9BvTUeQA1HLBJi
	SpDRuRYTUUEb7q1+84VHBGrH4owgrszCePCUJ
X-Google-Smtp-Source: AGHT+IETEgEHVnoBCl6tSd5ly6jPw1LbPISDppDEH/7WrohkBoOXGwU9cZSsg4zzP7dPPUTFxfWxwry3wrim9dTMmcQ=
X-Received: by 2002:a05:6214:20a6:b0:685:aa5c:5176 with SMTP id
 6-20020a05621420a600b00685aa5c5176mr3059902qvd.92.1706122242588; Wed, 24 Jan
 2024 10:50:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123223039.1471557-1-abhishekpandit@google.com> <20240123143026.v1.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid>
In-Reply-To: <20240123143026.v1.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 24 Jan 2024 10:50:30 -0800
Message-ID: <CACeCKadc2P92WTmtkN-SEDeWk7NVOVQhz2FpfgF2eWxXsx4SHA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] usb: typec: ucsi: Update connector cap and status
To: Abhishek Pandit-Subedi <abhishekpandit@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abhishek,

On Tue, Jan 23, 2024 at 2:30=E2=80=AFPM Abhishek Pandit-Subedi
<abhishekpandit@google.com> wrote:
>
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> Update the data structures for ucsi_connector_capability and
> ucsi_connector_status to UCSIv3.
>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

BR,


Return-Path: <linux-usb+bounces-23648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D7AA735B
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 15:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961F51BA39B4
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 13:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED65F255F44;
	Fri,  2 May 2025 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fPoJ56vG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7D255224
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192070; cv=none; b=qiGXskirE+6VH0vw9dsNmVTZmBK/hSGr4DzqLXPkynvcdCJgUcsapdlluVTKzAEsuF8MKIxOKv3wZuAEnyVU7fbsGM+BRISKSWa7sbamq6As+7dHo6i6lJprs92bE2x67fGdcMzfr9WLI2zFE5ZXVITspH3SqcX+x7HOhEkPZjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192070; c=relaxed/simple;
	bh=PR8rIhUfojOnm5GYJvzQzEEo4eH5EGtmUfEk+APf7Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sP431JnVqLNOqo3CIPNXgpl3lOZtlfQ/rO0/IeDrfHHE9sWOoNGa9gW0a7NHKNxjIT5Xaq/Pyhy3nYnc1LJQHeuoldElV2EWRKLPGdQHvbJ9ZFtqRkKy1YSf4ET2IGdliDflFvQyMF5d6azweUuTUmf5ZSODYiOJt/JmxajwsF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fPoJ56vG; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c54f67db99so376076985a.1
        for <linux-usb@vger.kernel.org>; Fri, 02 May 2025 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746192068; x=1746796868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PR8rIhUfojOnm5GYJvzQzEEo4eH5EGtmUfEk+APf7Bc=;
        b=fPoJ56vGCB5tm6aA/wVoN195ur7xAfFtAVAJcHhVAvHutmC5nWzGdo51yvoOR4gaBS
         Omgl1s1xedvyIHByq+kAho/xukzgoFXT0XGpd5UiE2FF53xcUfs+K1Le7zQbLl4ON2vt
         jh+KeIVrls8zpksQkzXjQyJ2RxSa9KBTP1W47MOl7B/jTi7g9WEquBpOR+ZcZMbLZAud
         8liFioAwwG+8m1cRBvjc8ZTS2aZyvtebhrUvNl6+m3xpIfJ1wr+OhWY+Lt4DLVNSfGzN
         XGgXtEfW+tDT9SHfalP03sflo3zHskYes1s4znOyg3Cr4b3PvIIK2aRV8NPBmuxbrMwE
         utGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192068; x=1746796868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR8rIhUfojOnm5GYJvzQzEEo4eH5EGtmUfEk+APf7Bc=;
        b=gjHPldh2IKWYWZSAPM3Oof/svZ/VgOILAMoFhtosqn8c9Uh2pWHHZnbmBDSRkATF1P
         zt3b6y/qcnv4o22rRUHdXTFZJk+EZgN/oC1UrLD+j3AEn9VhfpHq0bdD4w9H7plLhAXR
         YB8YEX9PjCLobqtXjHZg0AZIlA31LNOkHN611lka40vaFoqomb+nZv/cr148dT8WRN0t
         L/oJiaZbxslONasK3csVXV5LRsZ7xDOzzmLZtKo411FKjATwXfis4+jDg04zUitvj8Wj
         7Ts04sRySwK8XmsHh7QCvIh7sYZbvCEsb83rJ3xbk96bbWgSRLLO4kcSFF/+EYOuT7Sc
         MSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrR4EP+8gyyCzt1pvOoKtfNsw4Kuo1XrVjAfL0qNOqVXDzE20hkylg/8Hgf1CI5GkiZs7hRAwOvRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDIgBtfF/Wd8TZAQtBKV1gyBEFTHwBHDBPLJm8qUUKEmltT0u1
	E8RBkZDVlYcTEWLXeDTOWHbEwHeJ0lhiPjvzLbYiS1/ZyZT+IXhaXFfe5CoA5g==
X-Gm-Gg: ASbGncvmSAOvndaZbao2NFR/R+imBv1v9NnbwoAFI6sBepqC9VCsaFQZS9BlOTUjEM4
	VcvDyLCnTUzNuGWEXsjssKA5PNs2NNosAEDaxTqUcK1NcOvWvwRLyewfE61UpVFHVFibnDbaFhS
	dyUs5BXqWAqr7wyvy3BlZm4EAu0TlbbUeN7vTmhp+9vT5+YarOBj4u8h2v6RWeNYRxo54gYwhvY
	OEgrqmLEfx+bMnUQ0ElLCncm1kwR6GnvGAtAcvsDC6BYAD9xPg2vqUmJPpR6/bX+RyPsYyBPX87
	p9jPrAFTx+/rMP8vtni54oqZJp8o85IbrQlOJKJ1fg==
X-Google-Smtp-Source: AGHT+IHq26iKCiiX85zd4Rzb32AF63WsqwQ34SjNsJEMCsr8I+GA+YtyhS+XJmd6yQmIzjkSHMyyXg==
X-Received: by 2002:a05:620a:c4f:b0:7ac:b95b:7107 with SMTP id af79cd13be357-7cace9a0b29mr888832585a.12.1746192067938;
        Fri, 02 May 2025 06:21:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::283f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad24413edsm181273785a.99.2025.05.02.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:21:07 -0700 (PDT)
Date: Fri, 2 May 2025 09:21:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Juergen E. Fischer" <fischer@norbit.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-mm@kvack.org
Subject: Re: [PATCH 4/7] usb-storage: reject probe of device one non-DMA HCDs
 when using highmem
Message-ID: <b4fb1b90-1996-41ff-a05a-06f952b36ce0@rowland.harvard.edu>
References: <20250502064930.2981820-1-hch@lst.de>
 <20250502064930.2981820-5-hch@lst.de>
 <2025050258-afraid-outweigh-e36c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050258-afraid-outweigh-e36c@gregkh>

On Fri, May 02, 2025 at 09:02:57AM +0200, Greg KH wrote:
> Hopefully this pushes people to use UAS devices instead :)

If usb-storage won't work on a system then UAS won't work either.

Alan Stern


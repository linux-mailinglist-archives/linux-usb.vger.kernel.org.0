Return-Path: <linux-usb+bounces-30459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9FC53BB9
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 18:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8D674A572C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00043451DB;
	Wed, 12 Nov 2025 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jNzX628Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76834252B
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968332; cv=none; b=Y9CWLAXY5ypHGWCCRcEcpJHMm6M2O5AZ9dkXmFeoDdmD4FX7iC8djD/ADBQjWSEBjNmHNdUx6w0aKDft81HkcRS2I2IPZIWXRsohjyAVumihOuPTQRsUlPybdqmark4/r81kYKwkSzV4KR4Scy2whEBoXtEO2nL1qpaRlUtXIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968332; c=relaxed/simple;
	bh=OYOJXQx/bay3QRd1kgdNJdgiv4E6Yg2DDwWtx0GstKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEvHXL7p/Z1bDTFr0lZ2knlCE88+hBDt4phfmc7/PZWWOepoyF6bipXsCPIMgoTCLBVwUdIVRj+czjMruNH0AL798UIsjkDib6iSWXK9j+TUA2i1B7UymaAQfUxMUfLFHps970IDWaDpIOR7Bx23zdLVzw+3gt0EMM2kh8LlZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jNzX628Y; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2148ca40eso156609285a.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762968329; x=1763573129; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fLXs8CVokNNyf7sAHF+EN7UaZyMO6+J+ZGjUUY5TXGY=;
        b=jNzX628Y9kXSvZ5OOSe5wQFqwvMzQ+IiOlFXSHKAxZ3KMh4f7HEDw9uxKWanDT5NWR
         RCGwznDf0zSw1nN6vJpKTPeKKnTJIE2Vz/VotNN/6Jh6Uz7vHi1a9grTG/WdK1r88HhI
         mCTkVi8DVLgmGEThVoAKeeaACbniEECrG6XHv8nIqhedw/e+uQtr3VKnGAyzScOSf1yl
         NjqQM9HvgWgoF5Qm+BDZqRtYnRre5yZWvGUZNJkWnenuV0fPofV4yHKBg6jzhEKbH5ZF
         1TAibns+IFPI6eT4l8M4qhUEpJMHWJmdzxBz1Y5fd5jIHDkzApEVuQWhHEObOUMVAZvB
         SYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968329; x=1763573129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLXs8CVokNNyf7sAHF+EN7UaZyMO6+J+ZGjUUY5TXGY=;
        b=dX3HIa55nL2VD0fEA402J8pVspebTDd6BA5grysPS/OoX2IAPzSP31KIRKiNEjTjVZ
         1PNCkSGeTM6hS0uDhkeL+RrtKgNLDKgfepxgr04A/oDD+DcoafyDvN7mGFspd1lWgHp1
         kYielxQ4OjRIORBYmWpunvnM0O5+kZ/qh2BdUWVuzCILvm+naK7wIboqS0IJxc4cD88i
         s/3pzAqjBEm3WASCHZhimeOF8ibvm6dbnM0Y/FypmTbFltGdZr6ZOMpRH8k5rU4Hzb0f
         7Y8ESTs4NV3N1EVLlf+4G1xMmooFhVQvhu+WE60mylvyi1i/aUGURD3/HCKMK5sp8vhY
         kQgA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3LRs8BawpXbIbtRo2lxTW2WaJLJ/JCVgIHmRnKUYC0mFRykrypUs8CdFK0OhivJ/l567D2Gz0vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHEIA+cLHoXC/bdMYvHH80BlSKLS4EaE1nAQ+40jYv8xtkv0PX
	RAdiGJ5W036HIEkrLN50EF7xudqbiMMM1PHRxsB3yEuCAuA/DmSxbVq5nubXeOzCWg==
X-Gm-Gg: ASbGncvHOjefaNaxEGbv1mjY82NfE5m4omiBiZVVrbibjdR9SG7DNjJ6kO8XjKOvdVV
	mRS+dBXm9k06/dt2r31y/cYnGwXXEmAQ3dWPhGvNdG+i6fx0OvAv/N8Jt8BBl8eUxdU0h9ZVQwK
	kjjzpFKZqd0/w77ixroy6m+llDKy6qU/vxXfhpPUmVI7+pdNUltLCG9RZEW6VkYGt5A45OIp27q
	PLjhIneunIu22JHkvAZ0QvckU5HnvPUhL4qzoUWepYOl5p4wQNgLv1giBbgC/wTf4AxiosS8v9r
	DbWYJ1Rg5dUlxE0rFxjQEG4Oid+BMzn9ctT9W++gFwKAdZle99n2JUwqJkL4AwmTAOMiWa7V642
	pABuF+0WPWojHfqdDLzTRMtPRxX2TgPxJQV3siveQE189svNEaRvO3OMwY2CAZTBGSiHlhMFZBV
	TMGPRkNhgJwrft0RrjTJmQxn5qhYz2HII+wF1d5kRvVbYwBdKJV83r0oFTpJypUeJQ0hF6NnndR
	EA5ItRT
X-Google-Smtp-Source: AGHT+IHiovmU/aYhQm59y8iiDlZbTx5G9WMKAnCIH1B6dtt1Bx+dfhQEcbptLPGc2D8z7piQZb4+jw==
X-Received: by 2002:a05:620a:2950:b0:8b2:6ac7:aa4f with SMTP id af79cd13be357-8b29b7f93a7mr459919785a.68.1762968329313;
        Wed, 12 Nov 2025 09:25:29 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-29.harvard-secure.wrls.harvard.edu. [65.112.8.29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa26dd4sm226850585a.59.2025.11.12.09.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:25:28 -0800 (PST)
Date: Wed, 12 Nov 2025 12:25:26 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Rodrigo Lugathe da =?iso-8859-1?B?Q29uY2Vp5+Nv?= Alves <lugathe2@gmail.com>,
	michal.pecio@gmail.com, bentiss@kernel.org,
	dmitry.torokhov@gmail.com, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com
Subject: Re: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier
 QR30 (2d99:a101).
Message-ID: <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
 <20251112015356.1919586-1-lugathe2@gmail.com>
 <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>

On Tue, Nov 11, 2025 at 09:20:29PM -0800, Terry Junge wrote:
> Hi Rodrigo,
> 
> You might want to wait a couple of days before sending a v3 so other 
> reviewers can get a chance to make comments.
> 
> You should include the HID: tag in the subject--
> ...] HID: Apply...
> 
> The patch should be sent
> 
> To:  the HID subsystem maintainers
> bentiss@kernel.org
> jikos@kernel.org
> 
> Cc:  at a minimum
> linux-input@vger.kernel.org
> linux-kernel@vger.kernel.org
> 
> plus any of the others already part of this thread.
> 
> On 11/11/2025 5:53 PM, Rodrigo Lugathe da Conceição Alves wrote:
> > The USB speaker has a bug that causes it to reboot when changing the
> > brightness using the physical knob.
> > 
> > Add a new vendor and product ID entry in hid-ids.h, and register
> > the corresponding device in hid-quirks.c with the required quirk.
> > 
> > ---
> > v2:
> >   - Fixed title
> >   - Simplified commit message
> > 
> > Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
> > ---

One more thing about patch style: The Signed-off-by: line should go 
above the --- line, whereas the revision information goes below it (as 
it is here).  The second --- line isn't needed (but it doesn't hurt).

Look at other patch submissions in the email archives to see more 
examples of the style.

Alan Stern


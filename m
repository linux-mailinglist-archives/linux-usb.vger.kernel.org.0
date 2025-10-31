Return-Path: <linux-usb+bounces-29963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D265C25911
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 15:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 562FE4F69BA
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D3134B698;
	Fri, 31 Oct 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EPfpt8ex"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0819632C301
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920723; cv=none; b=lfmeaFNKlpx8sPd7aDTh3z4WY3j1N73qltnDVPrDY5ONMt/WBJN3YOiA0w6YtET03HT8ljC3im/x8VYaOe4w2CONQT7LqgfFHeVWV5Qg97kM79kdwPyUsxJqy4eMKC1LiBOFhi3icD0UVgOK/ZTQa9jz2NGg8OBeFlugB3kTVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920723; c=relaxed/simple;
	bh=5L76j+zuXHG1MHBpIZXuVQSIaQJX7GuLY5HJ6kmV/ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfcVVGk6TYgcmpBqVCPE167XHqaOzBZwcHzW11oFoCeFEamP5weQ64TbNeKiNNcbKA6ZNdAp0elZ/16py/0QF9En3wN06RL/NuIt9rYKbhK0f8MRJFgp6Yz92yb2kMZNjSPPQaYqcTkL3jZiK5vVGSFJTwa9MiEfJQSNAcTnO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EPfpt8ex; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87499a3cd37so17057036d6.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761920720; x=1762525520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts+XWgu1bIuF9gioKC8vzQc4NBdSlbXvz8mnrqcOtY8=;
        b=EPfpt8exaA/Bhwi+BUdvTAlmpUbJNWpxf13J70ussVRTkwzUSuj+1n/zGwt8YGhjmj
         eNdL3kPy3nlqfaiBoNTm24NYPOBFnvFaSvd79NbEaBx2e0Ax/U5Wi5qX9mjPgOyVGEme
         jSZR6TGqoE7FbFn9bJZSKg8y/KHK3usCLA9OPk4RXLRlDTdQXAvGH5QZwYOh1rm8s5Wo
         QAj//C1royiSJqNdmQ5iok5QLakMTPBpw2Vqart/aM+f0rpPFdIxe4EGBdrCzDv+evs5
         ylAHDydDoJ3bLy9mo3Wg+SR5M+gfv43tBzpRjG2KP5bVWiLshZBOVUtgbF+3fKvLkO9e
         pHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761920720; x=1762525520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts+XWgu1bIuF9gioKC8vzQc4NBdSlbXvz8mnrqcOtY8=;
        b=bQV+JwCQVKZzo/U1X73E/ePM+IrixUpy+eM89lUoajWfsIUwCR8pmdbTZwhBIn12i/
         PY+UuI16708H4TZS1FORAEkg9c3RZFXGJxmlgHZ5x980a5e3puP2ynbbu7w5jt6c7ZzC
         JGtR+aYkwSgiZvrGImLdHUZte6JWGVkkvkmgqteXN8wbBlfi3V249aYkTIa7AAS42RW2
         cIjMQa1VDCm+RHHkbtU2zl29Zknkok1MXxJ7hIBCZvsK5R6YAQUsX+JO0w51EFgBDNxK
         nywCN7qs3SP+YXBd+pJU8F3zItb58JPgyClqNrn9suWnTq9ee2yyhfC9LwhyGGVbFljx
         B0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj6sov/Byu7gm9R/exld7IbfGrf9knOyQsg4MGnwaWp96bGYv8DG/Ar/eMocss/Ci/RDUlamq7ipU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxioR/Qg5YrQzSoZTLSMpKzzpGrn2N9nqwaE4OdV7qsmb2UJD8P
	5GxprfBKMc9EBdoeFqpxbd6oTteO7E6Mtu/y68GO2ZB6RsVm9Md4gru4tWwEWsh/6A==
X-Gm-Gg: ASbGncueZmkp6okTpFowpmj0hvV3VuvF68Hfr7+l+j+pI+rAI9RtHx4O9NQgxadk8Vt
	8KTTb6lloHtXjBdsLffnQ9BsafR+pdRtvhAy7hBvp5aJNpzBqfyQmc87T059eXPFZo0e161ntPj
	yZ2PvO5SsNQALtBYeG6jzJOiWbrj/EPwZdSMe9VZMnf/Fv/D1f5ykg93SmBQ5shXr6jJ+TYccEv
	VCX3W8M1gWSwEw8t+LY5uINhvjeUyFmtwh/Wffy6u4qhoKF5XmXix0oLDjrKI5gRel/o5s8fz/Y
	XghJCufeyf8TAHlkUVTsOzzdOQn+02KhTfpnAu6VhqtppibqsQVWuM26Pbku5m96RgmLGI8WFbW
	QWGTQSmoiciymizyHH7r0LvQvnbde4qeLqma/9GewE3ZGzsD/rnIgs9NKIiOjxLe9I/84lpSp4E
	zb9XsFFj7lGA87
X-Google-Smtp-Source: AGHT+IF6emX81maeXlXvNR7Q+/JX5uqsOM8FgN5qPjqjUpWdjdqPZE4LA+SysAtKbX+FH1pFta/gMw==
X-Received: by 2002:a05:6214:29c5:b0:87f:9f18:49ba with SMTP id 6a1803df08f44-8802f2746d3mr38802496d6.13.1761920719781;
        Fri, 31 Oct 2025 07:25:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88036070868sm12264306d6.24.2025.10.31.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:25:19 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:25:16 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: storage: Fix memory leak in USB bulk transport
Message-ID: <697fe35e-a3c2-47e2-891b-c25861c95dfb@rowland.harvard.edu>
References: <20251031043436.55929-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031043436.55929-1-desnesn@redhat.com>

On Fri, Oct 31, 2025 at 01:34:36AM -0300, Desnes Nunes wrote:
> A kernel memory leak was identified by the 'ioctl_sg01' test from Linux
> Test Project (LTP). The following bytes were mainly observed: 0x53425355.
> 
> When USB storage devices incorrectly skip the data phase with status data,
> the code extracts/validates the CSW from the sg buffer, but fails to clear
> it afterwards. This leaves status protocol data in srb's transfer buffer,
> such as the US_BULK_CS_SIGN 'USBS' signature observed here. Thus, this can
> lead to USB protocols leaks to user space through SCSI generic (/dev/sg*)
> interfaces, such as the one seen here when the LTP test requested 512 KiB.
> 
> Fix the leak by zeroing the CSW data in srb's transfer buffer immediately
> after the validation of devices that skip data phase.
> 
> Note: Differently from CVE-2018-1000204, which fixed a big leak by zero-
> ing pages at allocation time, this leak occurs after allocation, when USB
> protocol data is written to already-allocated sg pages.
> 
> Fixes: a45b599ad808 ("scsi: sg: allocate with __GFP_ZERO in sg_build_indirect()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> V2->V3: Changed memset to use sizeof(buf) and added a comment about the leak
> V1->V2: Used the same code style found on usb_stor_Bulk_transport()
> 
>  drivers/usb/storage/transport.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..9a4bf86e7b6a 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -1200,7 +1200,23 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *srb, struct us_data *us)
>  						US_BULK_CS_WRAP_LEN &&
>  					bcs->Signature ==
>  						cpu_to_le32(US_BULK_CS_SIGN)) {
> +				unsigned char buf[US_BULK_CS_WRAP_LEN];
> +
>  				usb_stor_dbg(us, "Device skipped data phase\n");
> +
> +				/*
> +				 * Devices skipping data phase might leave CSW data in srb's
> +				 * transfer buffer. Zero it to prevent USB protocol leakage.
> +				 */
> +				sg = NULL;
> +				offset = 0;
> +				memset(buf, 0, sizeof(buf));
> +				if (usb_stor_access_xfer_buf(buf,
> +						US_BULK_CS_WRAP_LEN, srb, &sg,
> +						&offset, TO_XFER_BUF) !=
> +							US_BULK_CS_WRAP_LEN)
> +					usb_stor_dbg(us, "Failed to clear CSW data\n");
> +
>  				scsi_set_resid(srb, transfer_length);
>  				goto skipped_data_phase;
>  			}
> -- 
> 2.51.0
> 


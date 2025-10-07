Return-Path: <linux-usb+bounces-28968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF660BC1C4C
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 16:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35EA03B990B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5994A2D73A4;
	Tue,  7 Oct 2025 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cg9FtDgQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE134BA35
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759847760; cv=none; b=ZQ9w4b7UxAKsDUVGU2xU0xCdmdRb6sTqP1YSju+Rd/YumCxJtFBoYg1W8+cUHE6igq2hfzjSPSTzv9zZ2zWx3eKupB+qH34ndRoS4lj4gerPyl+eWiJZgJLJM7/zxcim4Tq1YMepiT57+EfIyf9+HLPMLUatuZu0IcfDEOjLKzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759847760; c=relaxed/simple;
	bh=regRTJaxgh7qeeyDDCNBzcFMB5JmMPvOXRi6OBzcluE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7j/7MHojNIml27xjbHXPg1IYtUXYBxrJVP13fp21HyoPs1iaMPwCk/aTkia9mTnQxw4zQo19lmvmBMn7QtRSXoLhvEdlh8wNNGrU/z9KgBcWxlxvXcgpLDbSbsfeIbb9VhCWxeaSfNej2QOv/kzs1pUVZbIiAT/JS8Eii5B/go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cg9FtDgQ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-856222505eeso678190785a.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759847758; x=1760452558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRamxrzBVuGOpSUk3qh+ypgd7seMVXXK09tQ2+8hsIU=;
        b=cg9FtDgQd36/yG3OQK/y0F6KWCTka1Uc5OKlMWgXLo3QBhBT9txGrdNKmAlwjQAJ+0
         ux3DfLFUJFdDi5ohABn2NvC8za1n34Zw/eMgeEo816x2asXWgz3+TnYRQocaliA+VE/p
         x8LPi1Nx0ItYPjxUnqTVWJgWExnZWgdNT7bwgQUOSo9ma2jnA5fooX6mEXlbbSABJC1p
         ELH+0dnNXrMJnBK8yPrbI8/uq2yUmu5ugVROnL6WTy0qnFnKVGIFmCDUMzHqA9Pk7gxe
         MUIuhRfQfUwFQ4kOtyOuzwmySQJD4dc14YYi7A0NgTN4HAbc8uKEX1KWO2FDAsvP9z4l
         zhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759847758; x=1760452558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRamxrzBVuGOpSUk3qh+ypgd7seMVXXK09tQ2+8hsIU=;
        b=xRtqiJJ7NxpcaPLHUspQzC53Bp2qR15DkV79VuxSsWBLDdkIgAit8J+g8bN63okZnS
         4aMX0BXakpkbZMKJDtKgqBuVRlO5VkiHoCWPeKlTiXG3vLL04AJCL6dT+19d6TwIvF/y
         nVElyK5LvDrLtMdigvoJKMNrurvcYsCeVGAdOqH4QJoMjzfXwpHABAnx0yZEF1xAwdh7
         Jk8WTnbpwcSyGE3ns7W41Lf62ACefOeWrzJH9g8BZaBBfQYypbdeWpeVDCS7O4EII4f0
         s1M2zS5D1zQoHfY3ZlV6HzVNdx9SF34tsrq80KGsJPE6VRfw1frGGLqshawuru08/pWn
         bKyw==
X-Forwarded-Encrypted: i=1; AJvYcCWQqbvchPm/ZEGRJnd+vaWT5xQL5MiibhVe04zVtH518umEkW54v1PDYzuH6l6qSRDd8V52DZHEl10=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCekAKxpg8TzN055c8Dj7gQZ68j7pgvq7QYD4AUEaD9iQwGPli
	fKPIgjGpnJnAZdJKR8dPWURELYxyG+569laIkKWANYlhbPvoLf0KDXIUlanA0iTiRJGa/IQc4r6
	eyQM=
X-Gm-Gg: ASbGncv0vOnbz2omKHT1fkzPygGddNh3YduZfBZ+P1+TlDZV24UxLY6J74RZceKbRHF
	YFqv4OM1W50g86fdairHqdJtr1gd60ojItDAmTOjIpbtm3CS62/RerzZYF9lLxmZeDK4A6pICyu
	9s6QFL/j0JA2s5gCCdHnD4aqilz2PgDj6koXDuEomyyrbWGMQzSc6dgoKKUg1cQlLWPWpWAdJvP
	sJJRacimU7tISN99Xy+JXWXeN299FuePvzh15UVGdDOjLmHJnEXIvgR9gAhq4ObMBPrMygupbh6
	eXSMnsU9BbH6I7YDCLfqA43VYuOL//O55h7WdLtEscUaMVtSJte50+Ui/HAWrdEs0F9v3xHzX68
	VuuEx6ioHwDCofmXeY9e2MfhMIqKn5EmOBC1O2Wt1MaUZXjkqL1luP3A=
X-Google-Smtp-Source: AGHT+IHWm4dIwsWzIoaDG1jNLwHUJohyJygkQjz2p9SfPoRvYm2wuas7ajccDTHX3D/j/6DW7675Iw==
X-Received: by 2002:ad4:5b8b:0:b0:77e:c29b:679b with SMTP id 6a1803df08f44-879dc882cb3mr199614706d6.65.1759847756959;
        Tue, 07 Oct 2025 07:35:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::5082])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878be61fc21sm142418586d6.63.2025.10.07.07.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:35:56 -0700 (PDT)
Date: Tue, 7 Oct 2025 10:35:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb-storage v4: Simplify protocol translation
Message-ID: <857a1b63-83d9-402b-a9cd-8aca0616c517@rowland.harvard.edu>
References: <db6b1fe6-4167-4d2f-85e5-4e160baffeed@rowland.harvard.edu>
 <20251007113732.14709-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007113732.14709-1-i.shihao.999@gmail.com>

On Tue, Oct 07, 2025 at 05:07:32PM +0530, Shi Hao wrote:
> Simplify protocol translation for usb subclasses.
> 
> As suggested by Alan Stern  to remove the switch case labels  with
> 'default'  or keep the  previous  if statements  instead of the switch
> cases and advised  reasonable value when cmnd[0] >= 0xe0 .
> 
> keep  those usb subclasses to default and simplify logic removing
> switch cases and set 6 as a reasonable value when cmnd[0] >= 0xe0
> which fallbacks  to value 6 which is old cmd_len for those subclasses.
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> 
> ---

Is this meant to be version 4 of your original patch, or is it version 1 
of a new patch that is supposed to be applied on top of version 3 of the 
original patch?  It looks like you haven't made up your mind about this.  
The Subject: line and changelog below indicate one thing, but the 
description above and the diff indicate another.

Since none of the versions of your original patch have been accepted, 
you should make this a new version of the original patch.  Please 
reformulate it that way and submit the result as version 5.

Alan Stern

> change v1:
> - update subjects for the commit
> - update commit  description
> - check checkpatch.pl script
> - update From:  and signed-off name
> change v2:
> - check checkpatch.pl script
> - update verion history in the commit
> - wrap git commit changlog message
> - update git commit  message body
> change v3:
> - simplfy protocol  translation logic
> - set reasonable value when >= cmnd[0]
> - remove switch case statements
> 
> ---
> 
>  drivers/usb/storage/transport.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 4d01f70f39ac..14cc608052d9 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -719,17 +719,9 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
>  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
>  
>  		/* Protocol translation per scsi opcode group */
> -		switch (us->subclass) {
> -		case USB_SC_UFI:
> -		case USB_SC_8020:
> -		case USB_SC_8070:
> -		case USB_SC_QIC:
> -			srb->cmd_len = 12;
> -			break;
> -		/* Determine cmd_len based on scsi opcode group */
> -		case USB_SC_RBC:
> -		case USB_SC_SCSI:
> -		case USB_SC_CYP_ATACB:
> +		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> +				us->subclass == USB_SC_CYP_ATACB) {
> +		/* Determine cmd_len based on SCSI opcode group */
>  			if (srb->cmnd[0] <= 0x1F)
>  				srb->cmd_len = 6;
>  			else if (srb->cmnd[0] <= 0x7F)
> @@ -741,9 +733,10 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
>  			else if (srb->cmnd[0] <= 0xDF)
>  				srb->cmd_len = 16;
>  			else
> -
> -				break;
> -					}
> +				srb->cmd_len = 6;
> +		} else {
> +			srb->cmd_len = 12;
> +		}
>  
>  		/* issue the auto-sense command */
>  		scsi_set_resid(srb, 0);


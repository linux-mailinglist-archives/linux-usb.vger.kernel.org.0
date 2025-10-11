Return-Path: <linux-usb+bounces-29159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C6BCF30D
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 11:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBDD1407F48
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 09:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DC5221FAC;
	Sat, 11 Oct 2025 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey63gQja"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332FEF9C1
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760175458; cv=none; b=iWZaZzwv0jUU0q0vs6egzv+HJACAMKEQ/DOJD7mndx2XJeWThufe4/la38/Q0Dnt+ymmf2jdA2aEqmXgty6zp2YNZijx/lPKvQQpKg302Vphr4UpfTRDIPluxQJV8bvgrwlwN2QeG0e9ieH+ITYdI8kV9eyLY45EYwfphbG4dfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760175458; c=relaxed/simple;
	bh=u5zjF4xHV0mJLT/FoCYTfCH90n75FZV5xsmye3fe+2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5gNGbuhLGrVobv/Mq9uVHocvj1KXaYK91f2cMDHXgTIPVSFt7vdtxFPzt1O4UflAAZoxYZIUXGE+LuM80aALXFoR7yQHpXRstuNBN3JodzZicwjcNUdytJg1peT0fJR1IV1LgxHXLCPLK7VDvmfMFp0R9ixfOOcGDlCoJUnAnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ey63gQja; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-781001e3846so2773201b3a.2
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760175452; x=1760780252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4USxVtCkPc52aot2RGVc2rDmpm0BolrLNDjW4OcdO4=;
        b=Ey63gQjaULmhuhRcEP2SPNlZnC0S5NzSeJ38jKvuPJorK3Kx4DvXm0nYm6JQKrT7NA
         Cop6vHYzwIq7kkt7nTV+rs0vKalU2XvMGyy5KQC0GuNextTFyoBt99aBmYQuhsj2W6tu
         /zMbVW1IxZzYTRYxEVZjqzn6OAkoqqGEgqI529OAzYu4BfyNmvilHCnCnxdLdfOWVVUQ
         jfVzOulsPHM4J+0Zq9fKm/URl8t3+LsvEE/jgyRlkoD02jqIhyDI2pvQAPJS2Q3ZPHpW
         HBqDbbbLj0GH79c6Fe5rD2qDmvgG+/xwxs++SkvC7jtKkrcypH1b2VwRuLFaRrjp5wuM
         UZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760175452; x=1760780252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4USxVtCkPc52aot2RGVc2rDmpm0BolrLNDjW4OcdO4=;
        b=C4uxB6EvxDC0on8X2/N8NTZhKKaXqY04Mtd1mNsRca6mlirkbN9N+9ECY0UdljTVGJ
         af3NKFgRPnG0bMAM+U3PZRMM4U1lI/r92o16nge/+DtjAqaB1FfttLMdU4HOkK5H6g8k
         0kMK2IGg76kpJ3NG7g6GxpiHL+wDW8YaESmywbJ4LjjBN3dD119oAQ1YXtbRggXv4r4h
         5H0RQ+l2tza/e/HA82RPvfSNM4+fWwQSX7GEwwQa0wM10uuXDEmVIZysDxwnZJEOufgP
         kmy1eGVuzY4qTvIX8DIjWTdrGVcI2c7r/yUtGFAFR+zoSkc3X+6I5CsqiDXWp4f37MTw
         fwBg==
X-Forwarded-Encrypted: i=1; AJvYcCXzjt0QNlAl53Oaxc5nCxH2YQm0xkl1kXGzPNq2l4QuCnPVA2DHz8afYV1UrtNHvP8z0pMk2zEzaws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXqXdkE7Q2yRpqXDU6XWJgUAo+2cq7tmRMiUBrksuXyMsXrh0
	pOTLUmxE8MEDX2Pj4TTFEEjRhx8EJgXF7AbtukH+J4CRaEpsmZPPo7+Z
X-Gm-Gg: ASbGncvF6mCdD0wzbaXmoRmrTRkkAuompHdD5EmYZKCl92TMmYtiLjut4PhiUZZ/u8f
	ayWk29k8HrKiOcWfv3iuRRYRFdGaa8iJ/h3lWwTnpULgDzCSZAfE7eiJPoenISYJ0Ox6UkrdMBZ
	5jADzukrWlPLRlsC126LPloqE0aO3DGfu3dqEMk3YN7SjskhhGhJxVj+tThmOiPXwNlnq38rPAp
	K/ciDtFfUal/gGTx2LTDLwhqLFFiMAGpzC3qfoLLQlKFrpjxW2gvqd6tqrzY0Nz0/1OrDiEnl+9
	891aZGj0VVa6Z7ZxKXkAqeL0NVc70HIVNv/k7OVk88icDnOlNdRYigpX9POVFdbqTFFWCpMep4l
	Si8uuR+CBhcfJZk2I/piqMT+8c+/yJhLkv65EBPU=
X-Google-Smtp-Source: AGHT+IEdGkpVjCNDAUZpumR0rFlR/mqeM1FB/ZWZ4wdtl9JFV+osqhQ0kzUTXElfmjiRN0MK/5XAug==
X-Received: by 2002:a05:6a00:23d5:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-79387a233fdmr16730292b3a.30.1760175452309;
        Sat, 11 Oct 2025 02:37:32 -0700 (PDT)
Received: from fedora ([2409:40d1:88:ea5b:9773:a1fe:6d1:6334])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0607e3sm5597560b3a.11.2025.10.11.02.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 02:37:31 -0700 (PDT)
Date: Sat, 11 Oct 2025 15:07:23 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
	i.shihao.999@gmail.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: Implement proper subclass protocol translation
Message-ID: <aOolUwtQHX7JUASe@fedora>
References: <20251010113003.22863-1-i.shihao.999@gmail.com>
 <2d7cd968-3365-4f9f-aa88-d953809bf0ce@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d7cd968-3365-4f9f-aa88-d953809bf0ce@rowland.harvard.edu>

On Fri, Oct 10, 2025 at 11:07:03AM -0400, Alan Stern wrote:
> The spacing in this text is strange -- double spaces in random places, 
> no space following the first '.' in the last paragraph, and an extra 
> space before the second '.'.  Also, strange capitalization of the word 
> "It" in two places.
>
Hi Alan,

thanks for the review  and suggestions .  I have updated  the commit 
message body removed double spaces and over cappitalization of i

> > -		/* FIXME: we must do the protocol translation here */
> > +		/* Protocol translation per scsi opcode group */
> 
> This comment should be different.  The "per scsi opcode group" will be 
> mentioned in another comment a few lines later; it's not needed here as 
> well.
 
also added new comment for the protocol translation 
as you said to make it different from earlier as per op
code comment.

> >  		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> > -				us->subclass == USB_SC_CYP_ATACB)
> > -			srb->cmd_len = 6;
> > -		else
> > +		    us->subclass == USB_SC_CYP_ATACB) {
> 
> Please don't change the existing indentation.

I changed the pervious indentaion as  greg k-h told me to
do so he said to check checkpatch.pl script errors which said 
alignment should match open parenthesis  thats why i placed it
under the open parenthesis and it does not have any  checkpatch.pl 
error so far . I have checked it with the argument --strict too .
Changing the line from open parenthesis triggers checkpatch.pl 
error.

> > +			else
> > +				srb->cmd_len = 6;
> > +		} else {
> 
> And you could add a comment here explaining that the other protocols use 
> a fixed value for the command length.
> 
> >  			srb->cmd_len = 12;
> > +		}

Thanks for the suggestion of this new comment i have added it 
in the second version please check the above changes in the updated 
version and if there is anything wrong please let me know i am ready 
to make any further changes and  again thanks for you review and suggestions 
on this matter . Thanks for giving your precious time to this matter . Thank you 
so much.


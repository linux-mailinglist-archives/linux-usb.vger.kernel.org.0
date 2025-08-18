Return-Path: <linux-usb+bounces-26984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73116B2A7A4
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 15:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F110B1BA1ECB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 13:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ECB3218B3;
	Mon, 18 Aug 2025 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wRx2Mkv9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1F320CA0
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524393; cv=none; b=fpHPkY+x0vSCwRxbSpNvouiiis1AnIo85TCFQCz2oISMjbwa11ooPZgY7lZ/E10yet3VIqX2lHpCOGZB1lDsE1vhAeWuXWwbWFTaCSxrt6VTZTVj2sQtsAwlf3Ui/QiQwhkq3VvPbNf6tS4h3utyYlcOpJVlgj0az64UC5ItkRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524393; c=relaxed/simple;
	bh=AI6v7kPfWMA+miNg7wbOZdVUU4EmkESLIotA5sBin+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyl1I8ucxWwMFC4+8vRUf9zpVGx2mO34sPLNix+F8HNsKxn7SZtsi4+CS6Ju950zI45v3qRLIM7x73ZySLcXTxsUG5JTTFQwMY7NoYHpp0FRbSr9Z7Yeqzvqy78ptNDySNwUKkuE+UqxTdbyVU6pQzWK0cL9+uhB6A9phV9X7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wRx2Mkv9; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e8704c52b3so503326485a.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755524390; x=1756129190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJZQTHKlHSqbl45CU5FPQQ9yzybUQR3l/MQNkEVJRhY=;
        b=wRx2Mkv9zLt0nIGnCW77nBfsTVYRAg2ety6hMo+mZfJE2rRcVM3JeOndPWXK4dIeoa
         3mlgAVprmbr60nMjsQE4IDRt4jpJfbE8pWk+MtBhnB2pfPxv04+VHJjGt4OdpK2yTDx4
         mmz/A9pboKrGcQB+T4iZnJ1SCnHE7STETDk98/ACUqHRRUIQVygjJtAbzcUcE7cU7Hej
         m2652y+DijrCpYKTqIC7Fzg3/9QlvHNfSX48M9bTYqsBGUwLBdbrQyK3eDt/ddvT4BTx
         04mFpDoLi0+ce1nLXkOMqfTrliuuwOZs6RrpuoMnVNrYjJn7xPsiZ+1IdeJ1Z/zsfp2h
         CEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524390; x=1756129190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJZQTHKlHSqbl45CU5FPQQ9yzybUQR3l/MQNkEVJRhY=;
        b=FyhQB1umRDlZHkU6XxuY1f1lWIOEC/HJfecFBZH/BVAG+PzGq5R4nwdtVZ7ZztjNbP
         XqG0tMNAncVbIUoZXSGJJcLG3W3lTcUvGsheVn9Hrf3W+UfxMjOcLrkC/XO7sdkD5kZy
         xauozFtNyPTozKc3gCY3wJ5BsSPhuaBx9lLlZTt9Sx9oZ8vBic197iQZ8MBryA39Yt/O
         AuAM+jeGQB58F+3GeX0OOMG5tCGLWVznEkHA0eXQjkUO30E5CYgMM1FhNmf3HRezoQF/
         Z/OqVHE0eSlAO6lDMxZyumUwF3h/2ayYJYfGC+uqlSYmv7XSf1vcgP3IWsQTVKsRVHXS
         ZmNg==
X-Forwarded-Encrypted: i=1; AJvYcCW4JrCKE01S6lXVWAToxgfZWvQTqKWyN2vm+4mjKaj9L0bpm8kvolH4vptAs5akqr9c6CArYRM5dOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhiwA4ZvU8INtmbatU32Pn0g9xpL3PEizfqn5CiXo6PkRjBxo
	Ym/JU9RIOg0IgWbdin21pD4V1QjOAwQuhRMBoT2c9gtcp/RCrDe3KhASBawjg2+K67vrMrKLiYN
	bkYw=
X-Gm-Gg: ASbGnctvBslEwlypJy/J2+QtsmG8hyKz5F3OXSoUsle6oBV7SpSu1h5iPrM4m+lUvaA
	Gd/rcs/3qquS6Rnh/v0K2Zzqe/xBIZIEPoYaTuee/6SSmHtFh19BugymcClY9zwnRY+g9buQEFE
	rIpVH99ALO/T3f6wa2ADQ4JAyLDxXGKvVu3aqdjT/OO2bQs6cznPxknnmJTnG1hDx6b4uFjGHgb
	V8hagx2HVyElxnJixOVjGvuMQkEEkjqnLFwmpcYE3Qhms4mPc6DC6ptLg3afgUecDg4fux/JJ4w
	p5SthF8Htx0v26+1ZJsfxmt1/Xlz4GXY2LY/pW6nUhA4h/FhlPZQKTougJq+Te14PPYF08Qnwsi
	0Jv5SJURiOyPQ49XL08PwuGkfVPa1qJBLLIZEp0A3Hnk/r4LdOsg=
X-Google-Smtp-Source: AGHT+IEgkXGuq4e7M7fWzb2YB+PMFX6Ym9FJYxEKg3lgYKU5qsCNHsFfMVtFsUYrPZpoT3cKqxi19A==
X-Received: by 2002:a05:620a:700d:b0:7e8:911:2311 with SMTP id af79cd13be357-7e87e0ba56fmr1573344785a.53.1755524390460;
        Mon, 18 Aug 2025 06:39:50 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba90b8dc7sm52929266d6.30.2025.08.18.06.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:39:49 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:39:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	=?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <f8e186a9-015f-4df3-bc10-33eeef1146dd@rowland.harvard.edu>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
 <20250813164958.6c6c34a4@foxbook>
 <aKLDXCchS20kaq20@kekkonen.localdomain>
 <767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>
 <aKMOBPTqZX_yJjOv@kekkonen.localdomain>
 <aKMY0XPLmK-TOWIt@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKMY0XPLmK-TOWIt@kekkonen.localdomain>

On Mon, Aug 18, 2025 at 12:13:05PM +0000, Sakari Ailus wrote:
> > > how about one of these:
> > > usb_endpoint_max_periodic_bytes()
> > > usb_endpoint_max_periodic_payload()
> > > usb_endpoint_max_periodic_bpi()
> > 
> > How about usb_endpoint_max_si_payload() ("si" being for service interval)?
> 
> I somehow missed your latter sentence earlier. I'm totally fine with these,
> perhaps I'm slightly leaning towards usb_endpoint_max_periodic_payload()
> but let's see what others think.

I'm okay with either usb_endpoint_max_periodic_bytes() or 
usb_endpoint_max_periodic_payload().

Alan Stern


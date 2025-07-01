Return-Path: <linux-usb+bounces-25362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3CAEFD1C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 16:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9EA4A64EA
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 14:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF60327702D;
	Tue,  1 Jul 2025 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TxbaM4eV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4A1885B8
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381487; cv=none; b=k8dWQj54LLMys66S1razsl0flQLjG0UWd4AKESUczri1gOykEMJS8qutQIWjFlPAP8o9oYF3YQCDBWxBax4qOIpKeuxKnhJgDbt9uS7aYhnuz+NMa01WlYx9SqRQxBT9JOMfkd7nt93FIc8JfOfMr9Fdg0KaKzepgmJ9JOjNBjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381487; c=relaxed/simple;
	bh=UzoL7K1DgbELUOr0ui+iyWIzQaK+LJsdOwm+clz8lm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsFNOf5HIpGJAJYQu50D+TYOsECNpu0Vy2Jc2rJ9zOsoTZdEVMxOetX1ECwFHuI3pUJg9N1AxpB5A/tcEadANERcPgxx7Ae55n34pY82m9GtNBrGbVKXNSfguZxBNu3kSHO+sUJr/4ASCL9TE8H3fhGPsZeeFbtSyO675Wp5LYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TxbaM4eV; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a43afb04a7so23423961cf.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751381485; x=1751986285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlt6HkWsjPtuDA7DFavNWsclEgVzxWUAqR2DN4vxaeo=;
        b=TxbaM4eVcPESJvvEhcP3tSq08Eo9D/2D3ZGQ9uBN29E9l4I0NFiG4/HbdiRafKUaRu
         12bM5dVzP/nJDAqRWUw32J7DO95DEwl5ECM8/8si4U9KojV5T1DA+AyLLYGm9mnUP7UJ
         8s5XgvzcYFZUqmDQViMudAY0+qrvTCCI1FAsCCzjb68MPA5Vx1rfjwgIj3n1100B75Ep
         Oi4KQebAoHkG7nDNILSYdANAAO25HvdTLzT/o1S0L++sCpcZzgV72SgFw6fF/wEdPD8r
         WwUM7QLgl4cUqCzSg/27Z/rG1I+n5HPzcGKZh8yW2jRRXJ+oL0fgeku/OAy4REt6JWNz
         D/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381485; x=1751986285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vlt6HkWsjPtuDA7DFavNWsclEgVzxWUAqR2DN4vxaeo=;
        b=ClDYF32rFhIQoQFBs36+JVgCKxlUfoT31hjJTXcX2aZujUvSOF9Csq9c6GL6dX5lr4
         mi/9CUN68dhVFzW71NY3Y1vFN3zcE2N1gg56PqYHksNuUjevvDqYmRYv9BTTyGMNrqyL
         jLuMq2MNFHk/XccEaJOt5j4ugqdgkFkLZo89nDx1MbdN9C4rlydKDnXgFZFMCaaqwyeM
         xtWx8qhZTj8FUPxZ+Uzlu/9Prl7U49ajEyx1XFJEeFMj8xKWIHhHP06JR17JoCCtL0q0
         sk0UOhNIpc7FaYHyg9XoKmTlCg1FhjuWcAIolC/Chnt7/2VHkQWNbTlo7e3tPtQywEPz
         aZ+g==
X-Forwarded-Encrypted: i=1; AJvYcCVKPDDy5fUo8WVWprwi6myqggnhcAo/Vlqn/ePSOFdWHhl+3MeQv20vWIlCbXSBMrPkIZpeyl9p+co=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdsBJPc91A2gXiZjbihVfCHsO2+x9bDkRRnQJqEgN9CMY5o1pB
	CsgSCqTDQ3YEhPTy5pXZpwDhfzwycShKANxGiTNv6CMHCNzzWKBm5YJePbXznsDqag==
X-Gm-Gg: ASbGncu4xNB3FqdEikGdu8qa6sbgVeqNUNdzVcsdY4ziUpoXTQygqWiSbiJS00XLEPg
	mq5uccnmMzSXwpxF/34yjX99gj/nOPi5m0P6lAOTgqpigiAqWfXgUXpCrBb2Qv4WaY9hPc4Mtx0
	GE6re3mgC0/Pv/Cqs+KlWzvvqlgAAUjWvOtnI1Y4ShZ5HQGokXgnZRoRi8hiTgROGWlDSq6VzYN
	3mMk5Cm6pvi2VJupVfNQxti+r44alZxgUUixHkWIh2dxTH9UpisIcf67qqKq0W6ZeKUFEG67Lte
	smrT+zpsXgZ7mb9tSbtArYS3fb0mNV6TfmRvYaxYT6B8sSNA0Rw+dwptKzDBQoWUtnup2sI9apT
	32KIt
X-Google-Smtp-Source: AGHT+IG2WAgD69R5Cx0UOslTbeqnt6ZmQFs9jqLYE9iO9Eo5OndYvPnf3ly/vD3jcuVTySG3VSMUiA==
X-Received: by 2002:ac8:74a:0:b0:4a7:fbd0:79c4 with SMTP id d75a77b69052e-4a7fca97159mr244132201cf.11.1751381484546;
        Tue, 01 Jul 2025 07:51:24 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc592cc9sm76815851cf.72.2025.07.01.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:51:24 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:51:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <adfbd9c0-4bf5-4dab-974e-4afa61d8492a@rowland.harvard.edu>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
 <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
 <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>
 <57695560-d6ef-49bc-976e-836ddc903d13@rowland.harvard.edu>
 <fornnnolaxn5zbw2dnepq2higyf5vw4dkdn4uptgz6tuki4zoe@wnclvwajtila>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fornnnolaxn5zbw2dnepq2higyf5vw4dkdn4uptgz6tuki4zoe@wnclvwajtila>

On Tue, Jul 01, 2025 at 06:16:23PM +0800, Xu Yang wrote:
> On Mon, Jun 30, 2025 at 10:26:56AM -0400, Alan Stern wrote:
> > So overall, I guess this change won't make any noticeable difference.  
> > But theoretically, how would the user know that the usbmon output didn't 
> > start at the beginning of the buffer?  I think you would need to update 
> > the documentation as well as the code.
> 
> Does the user need know such information? As a user, I don't need it at all.
> I just want to see the data transferred on the USB bus.

What you want is relatively unimportant, because this API is meant to be 
available to _all_ Linux users.  If it is changed, it must be changed in 
a way that is acceptable to all users.

And of course users need to know how the data is presented.  Otherwise 
there's no way to understand it.

Currently, Documentation/usb/usbmon.rst says this:

  In the case of an Isochronous input (Zi)
  completion where the received data is sparse in the buffer, the length of
  the collected data can be greater than the Data Length value (because Data
  Length counts only the bytes that were received whereas the Data words
  contain the entire transfer buffer).

It doesn't say anything about the collected data beginning after the 
start of the buffer.  Just the opposite, in fact: "... the Data words 
contain the entire transfer buffer".

If somebody has been using usbmon for a long time, he won't expect its 
behavior to change suddenly -- particularly if the documentation has not 
updated.

Alan Stern


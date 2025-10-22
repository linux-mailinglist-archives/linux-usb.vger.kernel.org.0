Return-Path: <linux-usb+bounces-29524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5BEBFC8B8
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2942F4E26DB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 14:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE7B35BDBF;
	Wed, 22 Oct 2025 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bGn7pvS7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE12135BDAF
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143309; cv=none; b=FQ8AzxfXG9fx/1fiYHZIN7CJfjYPjbXdMCKo6VGv/x2H+4/vaS9XGiRPFT2RnzFTfiyAlRj2AaByspxZfUVXsfDiXplFdZQumC2juUU0ffeioqSnFLLejkqGDKFiWbp+n7z1W9AyFuD+5xeeBErmCbl+Om7v5ufthn0onNcjA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143309; c=relaxed/simple;
	bh=7rFO60cs+ojMDtinvJI6S0GOckN6KLFDylmfbzmGFcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxWJ+baml9U9A+sk2ZpZh5kNc0CMU6vX5iprTwu5NPV9jAsLf0yzc08qJge+dQUMY/v8NWEPtD47YwHn4pKjrv1hEI6lGHCJL1hzDW7tVrZ9WYDvOkiTzlOG5zldLvcw3hxMgc6wyEnDdhWMfY/hg0DNAQfI4ypbxzsXrfhqLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bGn7pvS7; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4e896e91368so15019751cf.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761143307; x=1761748107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bt2mz88kxQaKeFfwo7y6zN05vfKzXencELjsqpI75vo=;
        b=bGn7pvS7oDgH95eIgW/v8JnsBxkFJLUwEa3p8koVeFqqmWr7TWdKi3WZ65EDCse2zZ
         xJhncabx+zGpLd4PWXhlme7uLYd3VSMdlnw6BN7nOz21TUIKnFMm6xZfTzQjI3ZvUkYO
         7oBD3HXJVCeOS0wEJgsuGQ+j4iYSqgU7FyfvOu7ukbVL2pcTz6knrl8QXbRmMBxhM/4b
         gMmXzjs3jVKKfY8S5oU1CzGBSWAcNcUAZ+AQgryrDL4WyE66aJnv38laQf6UbEIy4YPl
         8sRN8ALVhuofbKObuSDJVtH53t/4uu/h4cc15yOwkdrrMf+q7ZEtxLcIf/mEYmg57+VD
         yk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143307; x=1761748107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt2mz88kxQaKeFfwo7y6zN05vfKzXencELjsqpI75vo=;
        b=MOIIizoFdv/Bmw/jImruogprgC5cwvXsP+Ng75ik8CnOs2+V3YZ1WQVjJIWbeZ3UGu
         L/XfBf7x4nxnp6xlifNtBQfV/tKa3G+OLvYvvRq1E3e3CSe6nTGIppsHTcLuaN2y5XUs
         YGBT6nMxpSQyraVvXhmzTp3eGlH7KT+Qi2PcyJPDS00JUb3qscSag27kAF+7UZM1Wk3w
         rkHjWyJSetFqiVZFPKdSiHvrf3GfYql/j4cW7iwhrffKA2y6pLU3+nUecRK4dmLMoa6b
         58dcOgR1Pd8FCai9JnT9I0hiOvFDbwiI40b6B5qO6mmhL1v0laLTbMnrndXg8+dt8LXD
         CV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkq05xbuD4VWwLgbIOwMEJbpck4V93R0ziTnN0X+ZFIYSeV979n1Zdi0JQXnNWBQp/Z5RJ5OJyxb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaF6Vp+JsxO7bTd639NroGf/nUUa4LIjgZjy/BGlEaKP3Wc/zj
	kkQ718R1laHJv+t6QWu4nReoUyieya3F6GHwxDvT/Bqkb9mTfLTbcpxX8i7Zn3u3Pg==
X-Gm-Gg: ASbGnctHKfOMADshS7BuRQ2ltjsGKvrs7KKvqlCC2/BSpDf8MjYVONFcx8kH6vrT5gk
	imvbRqx2u9Jzz++nyXnqFOm4SHkOW9tW1JUlCHQLqwDzdb6W+C2oqF008IjFpmrV4ZyzaAJum8+
	sEFH3JtWKtr1bSFLX5tLwdrqFhKVsG1/nGRbNcZl7g62l9V08mCRvRWOeNbOIlC9Z/CHkXR8Fg3
	b0wT3yZnEIQSBGyknl6zBSZ7Yg7O0aWq/vtErPwJ1ad7uz8QkUJxJ3HYTGjWTs6d82oreosc0bn
	jXYjPj1FOW+qbbAqvnLIwwiCb1JogIs5G8sWMuxTVA/QMq7TiGMSMaK/jlqdjl8PGUH1HniqG5l
	eoSIOPNDpfu8tpmZLPP7kcNrb9TAFzPlh4W3lPoQmAfLW/ZarZkM5D+rrGmwSftN0wC/6nTKIVW
	eMU1QekCsUjHta6p7OLBnHeYRvJoEBgQ==
X-Google-Smtp-Source: AGHT+IEQFUBDmtWZDWA4/99CoLc+AR13PHUMRk56pDNsg4FZV887ScrpKn5yezdEL9l3JNDRfXtxMg==
X-Received: by 2002:ac8:7f51:0:b0:4e8:b9ab:8ad4 with SMTP id d75a77b69052e-4e8b9aba18emr149827841cf.81.1761143306656;
        Wed, 22 Oct 2025 07:28:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab10da83sm93572291cf.39.2025.10.22.07.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:28:25 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:28:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, yicongsrfy@163.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <7fd2d38a-08c8-4043-8dfe-eb2171b4e4e8@rowland.harvard.edu>
References: <bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
 <20251018172156.69e93897.michal.pecio@gmail.com>
 <6640b191-d25b-4c4e-ac67-144357eb5cc3@rowland.harvard.edu>
 <20251018175618.148d4e59.michal.pecio@gmail.com>
 <e4ce396c-0047-4bd1-a5d2-aee3b86315b1@rowland.harvard.edu>
 <20251020182327.0dd8958a.michal.pecio@gmail.com>
 <3c2a20ef-5388-49bd-ab09-27921ef1a729@rowland.harvard.edu>
 <3cb55160-8cca-471a-a707-188c7b411e34@suse.com>
 <fe42645d-0447-4bf4-98c5-ea288f8f6f5a@rowland.harvard.edu>
 <b3eb1a6f-696b-4ece-b906-4ecd14252321@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3eb1a6f-696b-4ece-b906-4ecd14252321@suse.com>

On Wed, Oct 22, 2025 at 09:58:57AM +0200, Oliver Neukum wrote:
> On 21.10.25 18:33, Alan Stern wrote:
> > On Tue, Oct 21, 2025 at 11:13:29AM +0200, Oliver Neukum wrote:
> > > On 20.10.25 18:59, Alan Stern wrote:
> > > 
> > > > Another possibility is simply to give up on handling all of this
> > > > automatically in the kernel.  The usb_modeswitch program certainly
> > > > should be capable of determining when a USB network device ought to
> > > > switch to a different configuration; that's very similar to the things
> > > > it does already.  Maybe userspace is the best place to implement this
> > > > stuff.
> > > 
> > > That would make usb_modeswitch or yet a new udev component mandatory.
> > > That is the exact opposite of what we would like to achieve.
> > 
> > In the same way that usb_modeswitch or a udev script is already
> > mandatory for a bunch of other devices?
> 
> Arguably broken devices.

Perhaps so.  That doesn't affect my main point, however.  Besides, none 
of the possible approaches we have been discussing are truly 
_mandatory_, because the user can always force a configuration change 
simply by writing to a sysfs file.

> > I agree, it would be great if the kernel could handle all these things
> > for people.  But sometimes it's just a lot easier to do stuff in
> > userspace.
> 
> Well the kernel does handle them. It just handles them wrong.

:-)

> You are not proposing to leave devices in the unconfigured state,
> are you?

No, I wasn't.  But that might not be a bad idea in some cases.  If 
userspace can do a better job than the kernel at picking a device's 
initial configuration, we should stay out of its way.

The trick is to know for which devices -- there may be no general way of 
determining this.  Particularly if it depends on what out-of-tree 
drivers the user has installed.

> > > That is probably not wise in the long run. If the device whose driver
> > > we kick off is a CD-ROM, nobody cares. If it is a network interface,
> > > we'll have to deal with ugly cases like user space already having
> > > sent a DHCP query when we kick the old driver off the interface.
> > 
> > Doesn't the same concern apply every time a network interface goes down?
> 
> It does and that is why spontaneously shutting down network interfaces
> in the kernel is a bad idea.

If the action is carried out by usb_modeswitch, for example, the program 
can be responsible for shutting down the network interface cleanly 
before it does the config change.

Alan Stern


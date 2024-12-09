Return-Path: <linux-usb+bounces-18275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C169EA193
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 23:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E7F8166146
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 22:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D58519ADBF;
	Mon,  9 Dec 2024 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfDyDqTJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989EB78C9C
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733781816; cv=none; b=lSn6k3UtRFhCaZbu6Pvzp9C33x98qi+1bidsMZ6UCJrN08NwIlm9bRZNnXzJylOPF48LDWZ+cKiQktMSSmDzSxVOCRQ7FlgvbhjNxfdUt4ohHqb7HiEACtcDMBsSfLay2yhwC8WzHpHDQj2qL8iHq+dgkEk7WDF99DSM330Pp88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733781816; c=relaxed/simple;
	bh=6at9e5Pdrug8th6rDNzPPUzwoqQ7Ugtm/+rt1U3Tkuc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=dri1mUlaiK6uuHfUjUzhRkv5MGoyTqmbp2KAVpP3qrN9mJ14TWlE9tFtQn7eBRMKyvQcBDk9nn2pZp+Dvs2TlEaJtySkS0/Uixh3Kcr5Hw7Nu+TSlRB8mTpS6z9UYyz0WYb/zG738kzFIZ3ngRuKNbpRLOgnRqDMj3KVXT6oDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfDyDqTJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1675748e87.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2024 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733781813; x=1734386613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFWs7DOuyAPb1cT4Cuw9YI7HXS4QjrHVgHOGWX0a9/8=;
        b=kfDyDqTJZyvGVifHwA3LlSibsS24qmrqmBEC2W5qbdMOl+oEF71xbBgTodRQ/w8cDW
         XApFGhdE6z0nJZpTBz8dNeBIp0+fCrf4ci9kyMZvekG6gwYVblbE0O2cQZYL54UtvV/p
         HmTXDaJWlO6Z3rcdLwp5YK7wPGb0TnP94WR9vqN/WpZdIpnIJUv27Ne403AJrVpZvdwF
         TkcC5iUVsmSQMMqP/ZY7T1YumYRJosY0jq9zushvgGEc+aACMj4ddXcD8zkTQOxIBO6C
         xktt3IPcrpcKQ6jZiJJ1FepLXZTcaar8VV4lF6EzEdpvpfFa6Vy7KVeC0Ks4beVhrUUY
         GVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733781813; x=1734386613;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFWs7DOuyAPb1cT4Cuw9YI7HXS4QjrHVgHOGWX0a9/8=;
        b=iPbuAuzqZdHHVxEh/RUXexIU75iiVS74Td2O/sncuDHS/ujGnbrfzhhf9ytoNG3oAt
         1yZpL7gskZT3zoubJzaYr8a+Q22hulqD+hEhT8v0zUrhq9ULCRiFLJjDyrOID6LcVjmt
         olGTP0FTEyWzKTHACCZGatl8MZBh9anffLxoDoYBNzFua2j8FEGT/5bVfND0exbmFC3P
         GaRe/LL6R6r2R5CYyGS5zRNUUALvduNE8y2ncsJP2Xq/qJiSjHWlK6TuqvQnhIZApxCL
         utIf+jEM8NBbuh3n3hXmKeI6dVRfYgVEvBTzTdH45CAjulvRjWWObVUOKHIzFf03dMyw
         tOCw==
X-Gm-Message-State: AOJu0YxfrZcDToIhQEB8aRNnXjk8D9NNkAPYTgGiuklxIENk6AHjmAWd
	1NG+EK9IlX//8Z7qPtlFh2bpOAXy3u9qHUfcTromcMF2HJHt1pBKAJEwkg==
X-Gm-Gg: ASbGncvhUgwkPSdkaYDB5dgndR9kxYSTE5cD5cUYbxcEaWvqgqfSJnGImc2gRgyZ/yq
	ftztLoEUkMASbFY+U1yzR+fwKtPGaMvBg1qBHVE8acslHpbA+FhLmOPUrVFekeR5VHdaNEE1NyE
	C11JIMcfcaTnua78pQXDTQLjM16ZreNeSbHCS0smJNfTYLFEs/U0MBcBd/jOJUJolu8kvNHefay
	3Z6SrN4a5TK32qX1g+Mw6IylOgTSn8JQboLgZ4nOj8jTjg4hTE+ESEoGn6ynyEP6TVf1A4=
X-Google-Smtp-Source: AGHT+IEPrUwtsVm+w/AGoZ9ikNV5/Z6koBcIeJ0s9mvgdU7XrZ7EzTbEnZJ4LFWwBnGGNw3eeYo41g==
X-Received: by 2002:a05:6512:a91:b0:540:1c67:fc35 with SMTP id 2adb3069b0e04-540240bcf7dmr779172e87.21.1733781812479;
        Mon, 09 Dec 2024 14:03:32 -0800 (PST)
Received: from foxbook (adtp154.neoplus.adsl.tpnet.pl. [79.185.227.154])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e377f3ba3sm1082152e87.187.2024.12.09.14.03.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 09 Dec 2024 14:03:30 -0800 (PST)
Date: Mon, 9 Dec 2024 23:03:25 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: chkr@plauener.de
Cc: linux-usb@vger.kernel.org
Subject: Re: Different speed of USB control transfers for HS USB devices
 depending on used USB port
Message-ID: <20241209230325.5a683364@foxbook>
In-Reply-To: <CAJugSwwpWKFbniGkdDCcGtKAbeYhoCsP=rMdmfaWGdFiFGEB0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I see obvious pattern that the bad ports are bus 001 and the good port
is bus 003, and they are two different chips.

Do you see similar correlation with chip types on other motherboards?

You can see the mapping between bus numbers and controllers using
ls -l /sys/bus/usb/devices/usb*

Generally, with xHCI it's on the controller to packetize and schedule 
such transfers, so this is likey a hardware problem.

Regards,
Michal


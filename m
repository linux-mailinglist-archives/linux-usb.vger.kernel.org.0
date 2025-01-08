Return-Path: <linux-usb+bounces-19136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17998A0597D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 12:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD022161A9D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 11:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917401F76D3;
	Wed,  8 Jan 2025 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J6IJaOXP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4051F7554
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736335044; cv=none; b=eYq+IrpSeD1k7f1Bs9pygjMWS2jdbllwl9rADXQZaEY1ZKm9JUu8Js9rVCvd4RzXcNxaiFsQ/UTRdi7ndLogENTv/kLJXAPSvZSaKo5UTP8TwzBP9dI8S3AbojNovvnvFu6/wDCpSDQ8uFfRlqQCqhlJILKhSoXBXPB6MbieWwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736335044; c=relaxed/simple;
	bh=0y1bAfglOObbolRyAlNmqOFCSW/eNyClZ2TFO1TFC1E=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cAABCtbJf7Y6F31CULo0T+N7FBxQ6Ke2NDvS47E48CEpaEu3NBD06SLgjQ7CB3g03g9nII9EAoKlSesdrDS1HiKyqnq7GeAypB1Pa/+q1eXIMqybVzOCo/TCMoe+GXPZqm2tUTDgGkQPWfd2Kmq+8OiaRLTVDKIsmP39FICrBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J6IJaOXP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4368a293339so134574725e9.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736335040; x=1736939840; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+nc7Tr0KGDMEsRrz/jRM23smr6p7WPpDL6H6zYPMoQ=;
        b=J6IJaOXPtFZW1qGzU98AE8eIKGvyMsZSmGq4OHAHIZvLd9l9ghN8AfL/5s+EFC5nlf
         k2FNSXS9Zib6myNR80eADpg8scVy5xTuHn9+27WNgJg9dsv4qu8G3pqL0XgC51MUJqoG
         6P4KJPMlf7XJojF10fZQYZh6X6Sw3mp4SfDwFZj7OEi+qQzWJUyZELY2tvveZDzmc6yT
         E11q6fL5GKeuUEJiLDtZjzGmSCPb4NNk4frO+9fSxnLu9mK3QRLIQ86688sl9BGtz1VA
         ZYS0lxDtQ9IsU1VK+/Tif4fT+k8U0YSSXphdurbfA9y/pz47OUMMyXIFgC9wBQIVCwVb
         muUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736335040; x=1736939840;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+nc7Tr0KGDMEsRrz/jRM23smr6p7WPpDL6H6zYPMoQ=;
        b=WzpJzn+yQUmqvJn49pR12rxyMJQMehh6exnpN5fuxOnFRnLH8SEQ9H8OsRgj6a0EkB
         /drgUe5/J5EZGqMmHpXF1eiyUZhCvagYlI3Gppk6QCBBTLAvbMckqpDbUUGziSnLhC7Y
         rWiFavBr2jHJorxOS9jZebLIsSRZcyh+sqvdfHkd48Ueva6vgyvHFLHSrw2AkGM28Hup
         MwZWonLR82Zyfq7u0tsIEmYsonTJGpoFvMBeAYbjGgedsYiPlmHCe4eSLPC8N25bNmgA
         WFR5Xh+PfPPNZ1rv/0y7k/unTQ3gFNE8XdV9/6QU/B9gnexqFkIALxdg3ThEzcQE90eH
         2bOA==
X-Gm-Message-State: AOJu0Yzj/BB/G4iXFEJow2mh3HrnXHcf2Yq4za5NY2iSVw8sPQJ1rjVD
	i3lNlX/jM+mR+tQlSl1yOx44fNgkHf2ZL983tECDHLyUNwdVZckN6Hjda7J1mJqlCX5TkGBxqEL
	Q
X-Gm-Gg: ASbGnctgtLWaRWZ0h6w+vpS5Ft3vJFZSTttA6bXu5IAnRFs6yL27xFdCMRJ2hsYvgKh
	3kOtEEQTxmPrCZLKu3DPXMJeN53hG5rpEXRejUb+MorCyBbFXR9tHMZHYBYDPJ2UeCVAxWj7QCa
	3I1n6ipje9plLnNL+4lwbW+zrbV7dxd2IOOF76PalST767UN4pYQD5XuSfNhgpKvZhXRweiqYFL
	YxZClieGtCIv9Jsw/lR6XFprpvEdGauHpXp6OwbllypbYmP4AzRkaAhAm+iY7ylvYJSwFzX+JRY
	pYyYJRdeL0b4dewd3y8O
X-Google-Smtp-Source: AGHT+IG6jiky0PnUQgCIt9wn+5lOSLXS/DOuEfJ7ebI9OkKDHrUrSGdOZC+7MTh6azlPWXoxssrAUQ==
X-Received: by 2002:a05:600c:4fc6:b0:435:172:5052 with SMTP id 5b1f17b1804b1-436e2686492mr17868415e9.1.1736335040247;
        Wed, 08 Jan 2025 03:17:20 -0800 (PST)
Received: from ?IPV6:2001:a61:131f:bb01:288b:89dc:40f:14a9? ([2001:a61:131f:bb01:288b:89dc:40f:14a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddd113sm17639195e9.25.2025.01.08.03.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:17:20 -0800 (PST)
Message-ID: <cdf7cc9d-48a9-4b00-8e6e-ddbfdbbdb47d@suse.com>
Date: Wed, 8 Jan 2025 12:17:19 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: Question regarding 5adc1cc038f4 ("usb: xhci: address off-by-one in
 xhci_num_trbs_free()")
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I was wondering whether this patch should go
into the stable tree. As far as I can see the issue
it fixes is old. What do you think?

	Regards
		Oliver



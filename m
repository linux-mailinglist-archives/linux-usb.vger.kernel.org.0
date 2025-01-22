Return-Path: <linux-usb+bounces-19629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41BA192D9
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 531F23AB30A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1F92135DE;
	Wed, 22 Jan 2025 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UkUeG4RL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2832135C5
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553504; cv=none; b=peVe1YdjDJkTDLyuMvcsUpXAsjOfsapr+vbCxsPPvG0L2Ol7x4gL16dwUafs3R+6va8zoNtsJYsV4AisWU10ZF1QXwPUDBdm33IIjDTxSSzloXq1OGhZJEYpWqZYwwiFYUIXrs6Qhnz+9gBI7xBIzz9Hc6LIt7AZ/UwJxqM28mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553504; c=relaxed/simple;
	bh=VTWgPHAbr3DRtgMuLSvIBqpHcizxbq4jn3ia6ld4R0E=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Fs5xfWtQ0qSQvQHOycOwV2FBqFOJne1hTa6qtfE/OiniIj2TyChz3+OOsDUpFqo1vF71l8bVOROD8soU3zu1tSNO04W8AaRbIZ2C89AEieM7Z0jCwgm0Jrui/B1WmxvpS6CJtmxXKj3BcAIAFonO3Is1iwq1eviTqSCBfcB5GJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UkUeG4RL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438a39e659cso28711765e9.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 05:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737553500; x=1738158300; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3OwsFWJPLS6ZqBoBlAkbCM0b6Ph9ykolnek7TEnjhU=;
        b=UkUeG4RLuPW+j7/ElIHWhYdUDIA8nIAPqGtuCppA2nxBFdqZ/YpfcWRzm2+NuhpRkA
         ES2g8KzPdwFTcrKrEdrO0dWdYZkQdKCW6WafKDmrIxmUb0dscGHj19GaNO/a9GP13PAb
         DA9QMtLKP2HctWT/q4/QfZqdBdo+jF9aWZZFFec41kBZpIq4lgbcfw96VQUMxcNcBwC3
         S1IQUDyrBc31e1LNkfsfS+v2vZtZ0pnrmVy0XwKgw9WEaSnGIPyTJBEoUbQywGO/pbRI
         PUuSK09DX2c4+xiU+Xlxg4twU6yLN9YCOgz3LXDxZUg+JIViLvsiy/HbIZ7TcRyi+h6W
         u6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737553500; x=1738158300;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3OwsFWJPLS6ZqBoBlAkbCM0b6Ph9ykolnek7TEnjhU=;
        b=RL6ZJU4yClAjTynKQs5ZpzHdXVXj39XV4JOLR/lwOjRChOE3SU4Vx2K5aJ+hQipuNQ
         efI73PrjlmxMi54vUKxwyVkBXA1z2ExPxLjtW53gA+0WGGmYvBroDiBrTD21b9L7Zqj0
         CBM+ndqwlD1H0Zc52ShuDMu/mr0XNFbuyWnjFpu5lh8jEn0p0tNCW5tqBW/b8HoGO52f
         GOaqvQqfH3j5qYDalAkAKuV1AoNNE4GEbsLS8H5yFr8mYjIoH7C0jyniPNG/OuaVMWyN
         NJNTqW+RuNs+cqoGX0ZY2Nqzp/UkAeU4+nnvUqClzoBnWeENodVveOph3V1TiQ9YM4+y
         uRng==
X-Forwarded-Encrypted: i=1; AJvYcCWjQs+ilxPaAOIYIYHOUuytp6d2QxKO7cHTqRk1vLNwV8QxhHfJKluEfl5FAx5WO1yQmH500wBv+P4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Wz1UP0kjr3hI2ogfnwsazDiB2gCfetHYxFyUkgPfmolux8pS
	Rb7UiXxzULdtjY360+j6A1y1YBnEU/rai8Q/zBCzdE+AOXzNM3LXxMc3jLAzGZAvIeYCHmwpqB1
	P
X-Gm-Gg: ASbGncutlao1KL1aLGzYxu+CKBY4h6dmlBxHGzvKl7HI6SStVFbjhinD83G7urOsL3K
	yJSllDcYG4L7vR27xPtGtsnTtD2ZwJvDdOtAgYkaNlwc+pMRRxq27fpf5E7pbxzOzkZ2LzKNkVB
	4cfLG0O/LsCO+QM+lZOVa1SgW6xqooLdZOl6dZc6V6EcYvHA58a8oCVAmDVn3/+C3IyEdFL30OS
	bbQhYbueTh2oP/bDkiAjQpWuiZC4mNcazNn5nYs0aq68pNngPMxOQEUjGG+Dzl5Ue2xvEyucSL6
	pwMCj5JV5Y7bAUXNsEPejz5o3SUOphXKfKPKCA==
X-Google-Smtp-Source: AGHT+IGde+2HMtpGFaHbDBB6mojCS4h/qtfKMtRkT9X+QFoPrTpPksGITORYzy7toW8+ay0780+2wg==
X-Received: by 2002:a05:600c:1908:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-438913dbf63mr194297505e9.13.1737553500408;
        Wed, 22 Jan 2025 05:45:00 -0800 (PST)
Received: from ?IPV6:2001:a61:1385:4701:9b57:b1ba:9d42:46d0? ([2001:a61:1385:4701:9b57:b1ba:9d42:46d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318c004sm25424405e9.4.2025.01.22.05.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:45:00 -0800 (PST)
Message-ID: <e8310fd2-caa7-4a78-8ff1-2bc2d07d74c1@suse.com>
Date: Wed, 22 Jan 2025 14:44:59 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Camila Alvarez <cam.alvarez.i@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: Your fix for most_usb.c::hdm_disconnect
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am going through syzbot's list of open issues.
It look like like the issue you posted a patch for

https://lore.kernel.org/all/20240730035745.110637-1-cam.alvarez.i@gmail.com/T/

is still open. Can something be done? Has the patch been lost?
Is there a remaining issue?

	Regards
		Oliver



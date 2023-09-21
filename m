Return-Path: <linux-usb+bounces-440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F287A99CB
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 20:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2FF71C210B8
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 18:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCC345F66;
	Thu, 21 Sep 2023 17:24:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762D045F60
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 17:24:25 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0314B3C3F
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 10:23:54 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3214de9cd8bso1118664f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695317033; x=1695921833; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:subject:message-id:from:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWAN5MZv4veBg7aWwcGtnoxuJQ30Vg0ZNnM5f3Uv3Tg=;
        b=Ze2OmTuBubIlclLAUZDpcUAOMAirz7G/w9JfeSNacGbE628zvO0gtoBJ5s4OPTIyyr
         3Esa6107dranPimqO1CJwp540kB9rfB5WAxpUTMwmKtQ7z89T925fKVwBnMjXF0paAUZ
         HBHJKBDdXsLtjBSf3czfh7/wsTtTKOfct3Auu9KbjAABVCNf7kdd4PIm2IWwyJTzNOx5
         zYkrL9O4IfF3fx/+27UOZLrVZbSnt7az58dtAF2nuKzU6y7tDz5KJN/3bwremvm/Eeyj
         uBL9ESvcNV6eS65K0n6dJsV+nfqDZeM397Z6DXR99vS473EKWEbJ3rHtkBKZhthlVVSE
         dccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317033; x=1695921833;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:subject:message-id:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWAN5MZv4veBg7aWwcGtnoxuJQ30Vg0ZNnM5f3Uv3Tg=;
        b=sPwkmHecgeP21LvTQtGPrW9as5dsFZ+/DYNjcaF5Q1Q2Nb6j+lDJnZy+KpFT9A3kQ4
         Toc9Ufn2K7rY4A1DPz2YJkHJPGI6y+uB5a53NaDekftjk+szHEfEkFKpdcoiK6uoczjD
         JFufkJkP/5WZ3vQ4xfUm4T9tcjjlI4Kq2XId/+FDv/ew7bfgCcVC54/eHRi4KnAKPi99
         H/2Bbh18V1afQrVwxoe+jsXfIQV5ECsDnrwWKwJxdkOSSM76nc+UeYZoXFz8MfIvyWQA
         IUJFHHiX7hSQ1UdySM7Hn43/e1XN66R2Wwf3NE7d8hZIhCJK7W/FZcIAay1W4JHjTRq9
         rP7Q==
X-Gm-Message-State: AOJu0YzhfKasyAiY+DnZgtBFt/Yl9rOAs6W64C95jIcOgNuPDDdk0WbV
	rJkFvBXAw1QSYBYEu38anbM9dQHQEdo=
X-Google-Smtp-Source: AGHT+IFKgVokb8cPWxftRTqQPMUMqh+b5czoriv3o4z4jdXbCqCnNFM0gD4LhHiYZSYNaiivgM+Kug==
X-Received: by 2002:a05:600c:24e:b0:401:b204:3b98 with SMTP id 14-20020a05600c024e00b00401b2043b98mr5777678wmj.19.1695297979883;
        Thu, 21 Sep 2023 05:06:19 -0700 (PDT)
Received: from mobalindesk.lan.lan (dynamic-077-001-061-125.77.1.pool.telefonica.de. [77.1.61.125])
        by smtp.googlemail.com with ESMTPSA id m15-20020a7bce0f000000b003fed4fa0c19sm4639133wmc.5.2023.09.21.05.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:06:19 -0700 (PDT)
Sender: Massimo B <burcheri.massimo@gmail.com>
From: Massimo Burcheri <massimo@burcheri.de>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <ab4b54381f1237d3ebe087433971c26af7265aa1.camel@gmail.com>
Subject: Re: SanDisk Extreme Pro 55AF and UAS
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb <linux-usb@vger.kernel.org>
In-Reply-To: <d910b948-7448-46d3-ba98-42bc6e644626@suse.com>
References: <8d8df33f29e9abc0c20909c028863e3b9674921d.camel@gmail.com>
	 <d910b948-7448-46d3-ba98-42bc6e644626@suse.com>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Sep 2023 14:01:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.48.4 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 2023-09-19 at 15:47 +0200, Oliver Neukum wrote:
> On 19.09.23 15:34, Massimo Burcheri wrote:

> > Searching the web for these error messages I found I needed to disable =
UAS
> > and continue with usb-storage:
> > options usb-storage quirks=3D0781:55af:u
> > That works, but reduces the performance a lot. What is broken?

> Probably your device. Are you using bus powered devices?

Which device, Linux machine or NVMedrive/enclosure?
Yes, the drive is bus powered.
The drive with same cable still works fine with UAS on my other Linux machi=
ne.
The drive with same cable works on the failing machine with usb-storage mod=
ule,
only uas is failing.

What could that be?

Best regards,
Massimo


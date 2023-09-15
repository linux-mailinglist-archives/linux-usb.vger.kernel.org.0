Return-Path: <linux-usb+bounces-102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BD7A12E8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 03:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6D11C20868
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 01:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9381815;
	Fri, 15 Sep 2023 01:24:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08393808
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 01:24:42 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FEB268F
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 18:24:42 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41513d2cca7so156511cf.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 18:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694741081; x=1695345881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74CtxUCIYHKHg9tWUr4iQH71rMCgTYq33VCTDKT+9KU=;
        b=SnYJtr+lnAINHypdcPq/d/if5PcWVnEjwBp+G8vsN2bjy59rTNel9a9GI5EoaRBW9n
         Rvukc3AP/SP8ikfd9vRaEzhUuDZ/9bObHjxXSknIr6D5mIK19zeUkkqip9PGW5i5ex3c
         7hemnDRVuqHwis1y0zfG59uVsulZNq3MiFrNgVgOGDDKiG5rMfss3+9IQ2BdV7VGDCwg
         TdAqEqSlXGzz4CLwHrFHmryDGcAonRp2oSBLc1xfi4SYDnWdUSwB+AS0cxtacRFwJy0Z
         aMaU4mbYT+AVRWuE4lX5GKNZih2a6GROvO9Xy7lXWxHjkW1GWlWmxZ1MMcoU/at1AVSl
         AEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694741081; x=1695345881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74CtxUCIYHKHg9tWUr4iQH71rMCgTYq33VCTDKT+9KU=;
        b=grIDxuJy4nDY9umqZa7n8Q/oEMZ8H3OOEgiLRM2AQ1XWjqM0nevXzxu3D3XQF/QL8e
         PghzJYv5oA6z+Ao+gNwlFYygzC8GByow6NqmEtnc/IMSCRmXYnu0A0o9xQBOdZ3aLvMW
         QyAGmMoSq/FaLQ2sdXmsxmalIFlP8rg+CFXr0182VldsiYlxkdrIpHmnhdn0pDez61Df
         K7aayWL1ugb95cDuKm4xb4yKgsIHYwzkzRZTTsLNOTYLtpw9tOuaBY0zbsR+pB52t7a5
         DMnHEXSw2PfiqoD4QvXX8XljBBr1pwrh+n7fWLEx4PdACgKTRdL80ah4+Kymh8uSapxp
         +yTw==
X-Gm-Message-State: AOJu0YzFIqrXswWIpZLFe0Lqg/cSNyKnGz3ku2fxtwKwlRKVuP4eSPF7
	tEvU0vcykmW4793Vfj6/xIRVCqv/XJmipqBlkeVGSQ==
X-Google-Smtp-Source: AGHT+IGFwUSKsgWRp7QDr28sTxEcIygWw9HdJsiUKYG75UfmKQUC0mX+HXPSLwhkIeiL3CIYCl7XZdzp0KHoRjzRn9Q=
X-Received: by 2002:a05:622a:13c7:b0:410:8ba3:21c7 with SMTP id
 p7-20020a05622a13c700b004108ba321c7mr160183qtk.18.1694741081098; Thu, 14 Sep
 2023 18:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230914182922.27157-1-quic_kriskura@quicinc.com>
In-Reply-To: <20230914182922.27157-1-quic_kriskura@quicinc.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Thu, 14 Sep 2023 18:24:30 -0700
Message-ID: <CANP3RGeMFnBdQ3yS3i_QqWCuQB34Ma8ToEnfH-WjZQBeNgqoFw@mail.gmail.com>
Subject: Re: [RFC] usb: gadget: ncm: Handle decoding of multiple NTB's in
 unwrap call
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linyu Yuan <quic_linyyuan@quicinc.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>

The casts should probably use the actual correct ptr type instead of void*

Feels like this should go to stable@


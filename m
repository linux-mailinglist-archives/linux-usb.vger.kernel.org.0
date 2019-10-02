Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3440FC8AFB
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 16:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbfJBOTg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 10:19:36 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34866 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbfJBOTg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 10:19:36 -0400
Received: by mail-qt1-f196.google.com with SMTP id m15so26577877qtq.2;
        Wed, 02 Oct 2019 07:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:mime-version:content-transfer-encoding:cc:cc:to;
        bh=Aw49m87vLYKWapGwlahs95wS8wqERdSTZivFro+pae8=;
        b=oQm3mMqx7xtQeRt+PK6bQLydj5sWAuK910kbKkizWxrxcna7gHeozaCucu+U5Hehxc
         p1CMBaARLHuLh5YzGmKynTXcaWWmyxVM+yr9yeAKUaFSPrzVFF11fbIshhJh+HFb1fhe
         O5dfIjDCaPYtqXhPp2xBfwAB17ckSAL9q8TFKO/VBdWge4Um40CIlEVgiaWwbubQJwWE
         8RjE089qy+CQOUwQX/TyE8o+/9c7OVeUA6/QNQ22suIlNK7GSP6eQLs5SiuOySwSU4Zi
         Nbps1KyI+v1qX9UW/dR9eAMtdttD1192uTPe0lihGNIQPRsXQ02iWs9vAx97SQs+9gvx
         5PfA==
X-Gm-Message-State: APjAAAV0cCDxmLB50eknWeZHhZTa9YtuIHv9Tt80ejjPG7tTfLSQAm7J
        pg51wI9puB9w+8SNrsvdjYjg2vPgrg==
X-Google-Smtp-Source: APXvYqxGW0CQmSSFo2Z8PDeszHd0R6w6TerOsl1sCm1tUFyZqFcaBxSiTg56+jd0El/fESmXWgfaeA==
X-Received: by 2002:a0c:fb07:: with SMTP id c7mr3074506qvp.29.1570025974463;
        Wed, 02 Oct 2019 07:19:34 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id u43sm13174870qte.19.2019.10.02.07.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:33 -0700 (PDT)
Message-ID: <5d94b1f5.1c69fb81.40e1e.4206@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:30 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] bindings: rename links to mason USB2/USB3 DT files
References: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org> <9ca2d136a1f79c878fff1208f9b536b0b613c0d5.1569330078.git.mchehab+samsung@kernel.org>
In-Reply-To: <9ca2d136a1f79c878fff1208f9b536b0b613c0d5.1569330078.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 24 Sep 2019 10:01:29 -0300, Mauro Carvalho Chehab wrote:
> Those files got renamed, but another DT file still points to the older
> places.
> 
> Fixes: 87a55485f2fc ("dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml")
> Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/amlogic,dwc3.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


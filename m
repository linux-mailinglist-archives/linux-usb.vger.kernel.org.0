Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC8313932E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 15:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgAMOKb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 09:10:31 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36019 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgAMOKb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 09:10:31 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so10237121ljg.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 06:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7OlKMQzCcsRUGgvEdeWbvqGWcVImgXH1krLJPTjnfkI=;
        b=cFD5zo+Jhig19UI4Dlen78BaHloY2LvbYeeVM+hLSkSTLNqjtdfXCrwQO4zjINEdeP
         uMtQe7gCGw3vp7WzzI4eY0xxFflq6KjtgTL6gkp/+25MRYcPw7xJwB1nCFABivNFxfcy
         S/HEDp4RdV7rLCTKbUGnoAhkxovc698cNZcSp6Hcc4kUShKmmGXUwlX5Kq5sOL0MQuGF
         ApsBSl61onxVdBM0bS6Whq38UU2Z39WvDXAePGJbYIwsUk8kH62c+J1r4MtKJgSp+EGp
         w5SnhausOsa0Daof0u7O87PoGkmT1pTqHF7iG9743QjGVxIYvTBmz6f2vNfVEre2OJCs
         pJzw==
X-Gm-Message-State: APjAAAVfgf1us74LueFaFpLAwjj9yGaDUImDXIi5O9BRxVlmu6XoPpU8
        m4ltH4WZcyYeR5wgyagGxDc=
X-Google-Smtp-Source: APXvYqxuxWblc/KsaYLr6FaqJQLiTlwDQLhqTci+mXMiOa08DbrauenZaZGYKPYL6fDoclCUIdOAgQ==
X-Received: by 2002:a2e:805a:: with SMTP id p26mr10962516ljg.242.1578924629674;
        Mon, 13 Jan 2020 06:10:29 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id a1sm5967218ljn.66.2020.01.13.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 06:10:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ir0QG-0005To-7c; Mon, 13 Jan 2020 15:10:28 +0100
Date:   Mon, 13 Jan 2020 15:10:28 +0100
From:   Johan Hovold <johan@kernel.org>
To:     =?iso-8859-1?Q?Jer=F3nimo?= Borque <jeronimo@borque.com.ar>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org, greg@kroah.com
Subject: Re: [PATCH] USB: serial: simple: Add Motorola Solutions TETRA
 MTP3xxx and MTP85xx
Message-ID: <20200113141028.GB2301@localhost>
References: <20200109152334.21077-1-jeronimo@borque.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200109152334.21077-1-jeronimo@borque.com.ar>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 09, 2020 at 12:23:34PM -0300, Jerónimo Borque wrote:
> Add device-ids for the Motorola Solutions TETRA radios MTP3xxx series
> and MTP85xx series

Applied, thanks.

Johan

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C9C108688
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 03:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKYCls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Nov 2019 21:41:48 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35887 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfKYClr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Nov 2019 21:41:47 -0500
Received: by mail-pj1-f67.google.com with SMTP id cq11so5893906pjb.3
        for <linux-usb@vger.kernel.org>; Sun, 24 Nov 2019 18:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=vpcMnYMjWYS8DIMwakdoJOSnTdAd/sfg5glTHryQ/YE=;
        b=GsCZj/uTi8DC3RrpUi23MhEjgk2PN5p4FguE+opnZbRs8WbJo5F7WqdK90BOhowhuE
         qFz5phUxEug+Q0TMDAf/h1gI6QDC8kY0nRkhbfGxqQJaOMurQXA3YXBycc9PCD4ZDbyX
         WARSZvQWNBcmBap77hUwQ0zJpMsRTQkgnGym1s/AnC2isK2l7lUxHiqNl4dDArUcF0+p
         FWtEb2cwD6FNRLWKDSk3i1YQu9PrvENA4gXxn5XRXbsl5ileybrtFpJ7RhyvxpAy070T
         wsGpJA01iWmJddTRYXi5SlRSGodDNRAArRLeSintjQ2I+mYeHg7EjFv7dvBVWh63nABj
         HC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=vpcMnYMjWYS8DIMwakdoJOSnTdAd/sfg5glTHryQ/YE=;
        b=HnIZCN7vSi0OOuTxWzbXmABqXyrhtXJitCIIu9oEHwkWsvYy14t0bSEvgesPT4YRgc
         pBDpPRl2udLZxr/nk2Ie5ceOhltjQAGV6DjhUlNfTm1gQ26BA7Xuo2UgdXWWXJF9vGdJ
         2kO1e9Dmzvg+XOi+0ytq/Tp3Enxm1RGpt2HiTQGUoMJcHAuNwTJiGUs++LdIdZ6HoTKe
         CAbiXiyAHDM3lBep1w/vRW+DPQMibH6pTx5BxO8hmCEigJn97gERmw/GRZ6q/LaGV3jZ
         kQSocyqTAh6bJniJ/2io58aYfq0q7VbNCbr3j/SbHEaLqxr7+NPQa8RUvpaiHTdcKiQB
         9kwQ==
X-Gm-Message-State: APjAAAUFpmYysy05TJRQT9Lh9cNq4teTqF83FQ4/FE77t13I8d+KiGTj
        kcGe+0/jb+x0VramrugNvYEILw==
X-Google-Smtp-Source: APXvYqxrqSid3BDDvc0SJVRndH6NrbQKrnVb3i0ksnT3QWzq0AHOOMMvbzwxmXKjcrwlmKmLOoUAFQ==
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr36208140pjr.107.1574649707193;
        Sun, 24 Nov 2019 18:41:47 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id i10sm5846372pgd.73.2019.11.24.18.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 18:41:47 -0800 (PST)
Date:   Sun, 24 Nov 2019 18:41:41 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     "Andreas K. Besslein" <besslein.andreas@gmail.com>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, davem@davemloft.net
Subject: Re: [PATCH net] ax88179_178a: add ethtool_op_get_ts_info()
Message-ID: <20191124184141.229d4104@cakuba.netronome.com>
In-Reply-To: <20191123210447.GA8933@spectre>
References: <20191123210447.GA8933@spectre>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 23 Nov 2019 22:04:47 +0100, Andreas K. Besslein wrote:
> This enables the use of SW timestamping.
> 
> ax88179_178a uses the usbnet transmit function usbnet_start_xmit() which
> implements software timestamping. ax88179_178a overrides ethtool_ops but
> missed to set .get_ts_info. This caused SOF_TIMESTAMPING_TX_SOFTWARE
> capapility to be not available.
> 
> Signed-off-by: Andreas K. Besslein <besslein.andreas@gmail.com>

Applied, thanks!

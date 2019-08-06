Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63DF283D3E
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 00:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfHFWKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 18:10:34 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43978 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbfHFWKe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 18:10:34 -0400
Received: by mail-qt1-f193.google.com with SMTP id w17so5667394qto.10
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 15:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=k5MlzirpZYamcdWz7AWbdCMy4iWhcebC9AZ/B4iX4vQ=;
        b=DiNlS0lMBqKQ8N8XEC9ggrn/qkh+UA2hvtCs3VnCp/1FDuRFh8AWh0IrPMQTSI1seh
         ILTlQ69cQuC8/r1/C++1zZs61I17M+qy5aejqcX8ujbltSmqJ1JxPV4twEW8bb/XA75B
         R2wDG0iLFvBwzqcChOWMGDsxHqs5u1o207qqjuEv/znX7OKV48xSF6SE1i9X2jzYisqS
         zSyAFrx2evZTUZNrvCIVwVGYMifT8jRUHFC7oRXrAH6Hf/lj4EaJLSciLzD6e6GSoyc6
         KQpvphQctVTQIdodoQQq/kfH+9K0S98Umqp8zkpdkLtRZmbCCklHtYljPnaonLTZ5sEK
         Okug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=k5MlzirpZYamcdWz7AWbdCMy4iWhcebC9AZ/B4iX4vQ=;
        b=ryMYLo25Pz2tVbcuZQNtFal5YzEO/AP+RuH+FceYI79XgHd1Y7ZCm1TIihhpetq4RX
         kJLWx/IU/MVOBCj8she//4873ClB8Gl22dWFvg7bdhm5cp7yi5NY44Gx1WeKJP0/nKmV
         Q2TIIJZ3h/yz2eN7wybXL1FFeD31L2Ko2WDG5FRe+w0QgBfN1W9ZhY+8Uo7MNgqobzcg
         2hTMq47QVK2cfqcCxdKHxeErrvLrzfaG7ccy6AacuQNyu5deCKLop/btf8s2ppEb6NZB
         7Pc5VTEuzSepaKkjfSr3eaWlEw1QEalAToeAa1gkVhRIveSwVimgRAhNb/OwwuXxmzJT
         i0Vw==
X-Gm-Message-State: APjAAAXe/kkxojL06w+td6x8X5NwH/21S4F8wBKoxdF7UWT5nkKsSIf4
        yMxG+KsGrMcPMtSZKZXx+r6yDA==
X-Google-Smtp-Source: APXvYqxJVIiFVF2MvxFJ5nvgTIbxn2d6z4r2/R64xlzNBTDE0v1VaGLNq/YntAbOLyQiOadkdwKc7w==
X-Received: by 2002:aed:3987:: with SMTP id m7mr5096695qte.56.1565129433194;
        Tue, 06 Aug 2019 15:10:33 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id t26sm47547788qtc.95.2019.08.06.15.10.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 15:10:33 -0700 (PDT)
Date:   Tue, 6 Aug 2019 15:10:07 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH net-next 5/5] r8152: change rx_frag_head_sz and
 rx_max_agg_num dynamically
Message-ID: <20190806151007.75a8dd2c@cakuba.netronome.com>
In-Reply-To: <1394712342-15778-294-albertk@realtek.com>
References: <1394712342-15778-289-albertk@realtek.com>
        <1394712342-15778-294-albertk@realtek.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 6 Aug 2019 19:18:04 +0800, Hayes Wang wrote:
> Let rx_frag_head_sz and rx_max_agg_num could be modified dynamically
> through the sysfs.
> 
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>

Please don't expose those via sysfs. Ethtool's copybreak and descriptor
count should be applicable here, I think.

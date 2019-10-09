Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D38CD048D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 02:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbfJIADy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 20:03:54 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44238 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfJIADy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 20:03:54 -0400
Received: by mail-qt1-f195.google.com with SMTP id u40so779811qth.11
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 17:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=WqGF5bRn2qBJEYFx3A8CTfvZkg26MRFOSHOBN5dL4Zs=;
        b=Ze4YkFtBd5/DzMCSd2oh1KaJH6cGGY3c5lDfG6pSZ6jOxSQiT6uvs9O27SpmKr8rQr
         PlkpW/HaFdKu4XO0WSsE8IPz7r3ukK7simUgA/7KRYbxWRsgu1LSa31uflzrX8M5g1Cy
         ZPaDxwW2/6VuTDwJI4uasQVL5QX/GNIHGvJdT5O1EAkM0BpYxJ9u3LfFCsjmQaxgqIno
         ccisTei/iVWOxqNU6DOQnfxb0dOPxUae5mXVTpsl1KwpH0z/XS6KAscYbJ6tHVnSYV6U
         0CMSX821kQbAi7n8VRG2k5ArRMcP94PoEIbz0KF9Zo1Y6UbI1QkjYJUUmWaG6sZAUYCF
         IlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=WqGF5bRn2qBJEYFx3A8CTfvZkg26MRFOSHOBN5dL4Zs=;
        b=j0LiccWWACpBrOkwG4CnFWOMFSHB3CrX/9TZaRO4dKSbRJWbpxpuj5fBO/Z/5hhZne
         Cn2+U+bwyBwQVstIPVg8Ppm5hEsIG0ExywtFkQ3vX5FZQbDWKSOX9gQ91yar8+fwlj5C
         lhzYFSqocxZ0AuVhgOufff7KrqXWb1E5YzdLna4K3nR8zpATXz3L3x3n0xgg8iUBIGRU
         FCmi+YibCRDHFal8YOzVJqLY7GuUYGW0pW9YR+9Wf1ZZ8FEAzZSNQCk88Wa8Qoe+1Hu2
         PK0045Lc9GVDPPeTjuJSqcafuOUuduE7nBSbSSPFsC+SvnT5PeSbf4ddCOWsQf6jD7Ld
         DnVQ==
X-Gm-Message-State: APjAAAVpkC5Z3eubMOj8REbWCYtL60FRkodr012ZDEVna3MoNvlb1Dq5
        BNhBHxqm6Nm/l+Vg2/SFARNP2A==
X-Google-Smtp-Source: APXvYqyIADhe7dvws8woSGcXlrTNvM3J0iaMNtO4UCC2BKh5+RZ9ipEJU27LBFUsyJIUN3nA3SIVjA==
X-Received: by 2002:ac8:6952:: with SMTP id n18mr684128qtr.297.1570579431767;
        Tue, 08 Oct 2019 17:03:51 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id u17sm153412qkj.71.2019.10.08.17.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 17:03:51 -0700 (PDT)
Date:   Tue, 8 Oct 2019 17:03:39 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Rusalin <arusalin@dev.rtsoft.ru>,
        Lars Poeschel <poeschel@lemonage.de>,
        linux-usb@vger.kernel.org,
        syzbot+cb035c75c03dbe34b796@syzkaller.appspotmail.com,
        stable <stable@vger.kernel.org>
Subject: Re: [PATCH] NFC: pn533: fix use-after-free and memleaks
Message-ID: <20191008170339.5b0843f2@cakuba.netronome.com>
In-Reply-To: <20191007164059.5927-1-johan@kernel.org>
References: <000000000000f0d74d0594536e2c@google.com>
        <20191007164059.5927-1-johan@kernel.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon,  7 Oct 2019 18:40:59 +0200, Johan Hovold wrote:
> The driver would fail to deregister and its class device and free
> related resources on late probe errors.
> 
> Reported-by: syzbot+cb035c75c03dbe34b796@syzkaller.appspotmail.com
> Fixes: 32ecc75ded72 ("NFC: pn533: change order operations in dev registation")
> Cc: stable <stable@vger.kernel.org>	# 4.11
> Signed-off-by: Johan Hovold <johan@kernel.org>

Applied to net, thank you

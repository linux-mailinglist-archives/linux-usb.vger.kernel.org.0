Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F22D781823
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 13:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfHEL1v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 07:27:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35146 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEL1v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 07:27:51 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so79062587ljh.2
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 04:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=td8ejJiX9Ls6/WqgizVmuaf8mXozV0hxKACvtat6eLw=;
        b=EKdRM3M7QJTCZo3ZDsoS/HlfqeJ27n0/kaVrM9bQzyWixRhHQlgwgnPplvmAFxOJVR
         n+LcpJOY/KjhZ91IaarNmYI/3dAf50qqaJKlaBBnj79R9XgqN/Biv2kLLKfqXM7Bk2t4
         xpkXKtV6Pb2BNoIi6ym8l7GSrVu1PY8gAgjcds5LFPYakXYBYtlaLJcJv5sNlGtmy9Of
         LdfwIiKkDQKkVS80u9Pw9he1R7IloRFs66tVhKckQB0oFC+AAjwMI+kpcga+SMbllucU
         HQjFkxZXWQfCYMB4HvHFghqp9HViZH9ul+O3QxRVA44lWzCb00zQk3MC13CV1d25GRiT
         y23Q==
X-Gm-Message-State: APjAAAWKs4XC5YvP91NYbzPMeMV3vDo9OdR87INTqp86BRCAmwtRY2Ot
        SMpGUcn7+ZAwtZOE2sXKiZo=
X-Google-Smtp-Source: APXvYqx7GgJyvzPHdbob+okYfhUWgdwq4FcOdWdz5e4J+Rd3wopYYsv+DxERYgjsTSsFxpmL4t5LOg==
X-Received: by 2002:a2e:9997:: with SMTP id w23mr26521851lji.45.1565004469073;
        Mon, 05 Aug 2019 04:27:49 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q17sm1767991lfa.82.2019.08.05.04.27.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 04:27:48 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hub9X-0007eB-2t; Mon, 05 Aug 2019 13:27:47 +0200
Date:   Mon, 5 Aug 2019 13:27:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
Cc:     larsm17@gmail.com, johan@kernel.org, hyamamo@allied-telesis.co.jp,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: option: Add support for ZTE MF871A
Message-ID: <20190805112747.GD3574@localhost>
References: <1dde5abb-2399-6bb7-531b-c88e5f0b4fae@gmail.com>
 <156362896395.30109.15607667410549474761.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156362896395.30109.15607667410549474761.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 20, 2019 at 10:23:18PM +0900, Yoshiaki Okamoto wrote:
> This patch adds support for MF871A USB modem (aka Speed USB STICK U03)
> to option driver. This modem is manufactured by ZTE corporation, and
> sold by KDDI.

> Co-developed-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
> ---
> 
> Changes in v3:
> - Change used macro to USB_DEVICE_AND_INTERFACE_INFO.
> 
> Changes in v2:
> - Add Co-developed-by tag.
> - Move away product-id define and add short comment after the entry.

Now applied, thanks.

Johan

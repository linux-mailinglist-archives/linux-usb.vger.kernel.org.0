Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 302B711C9E4
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 10:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbfLLJvn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 04:51:43 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38190 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbfLLJvm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 04:51:42 -0500
Received: by mail-qk1-f194.google.com with SMTP id k6so1093280qki.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 01:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6MaSZO+z85RwBDn08Zp23qAhGeFPpQP6Zmbdykvp7xY=;
        b=urhpjpFmiHrpKuTd2fG68T0QYR5xRotSkvxQGdSBdbj7uuhwQwid6+6hQxFpSdUQlE
         hwTss/D6QopKGmM79dw3ZYbS0LSHqfpcYd5DiIp4Hep18HRECPd8r+CLuQ9yK0+/gFiE
         vKPYm191N11iMuemZ/RAbuUeBtuKS6vMVVfWattV+W679fW60GJvfdz769BP3JMzaktQ
         Nqe/hjKaEyfmsdJNtsBXZ/2VPLtsyN3eG+HG6Yv5u+VV190Onmu0eP+f6HlU6L15/6fk
         SC3UWY7UayBe2M/Cm1nFLBoOqK/JNQKSNYoqj5PLMfBvDMjNfWw624vk8DDEoJvbWsbG
         wobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6MaSZO+z85RwBDn08Zp23qAhGeFPpQP6Zmbdykvp7xY=;
        b=tWTQTpy9ui/7O1eqPRzdc8fJc0yuXAlpur3gHURYOGx0d+/r2fri0k30pzZhTKfz+A
         RI9SmFb9ARfvC8HGqxW5pFng6WytKH3osyl9nYJAapKUSLI9e0e+CmD59ALuJzHEhG1o
         OUbk9M2mAlNzBm9iOTjJodxqOxCqp58lxl3OdLTUfY4obOsUbs7514pyRBvU6uM8WoAI
         4me+7m4WsiG16fQa2+A1IicdW74Ug4jC9T+paswwIiuiIAfiDfau1BV/V8O/4dpY+2Tq
         YcROI13dgvsBtIgl+9EQxzJhZJZ7Tu4dyCt5LCbJ2QpH9iZnGWfU+i0qiF/u8DslqYuf
         38HA==
X-Gm-Message-State: APjAAAVk71oT+cJJRxnSMjbU8l8cUj/AcxrCq5Y9jj/twT+KaKhrLtFd
        2nn2kGyTdMf8dHgb46HJa7M/C4q0HIcF5lX2qOAp9w==
X-Google-Smtp-Source: APXvYqy94Fq9uJhhdNDZwpWMEn9HriQ0ZfX+BDU2cUmjZQDZWmYH9ITaA+scqynbxI2D6ClS14AhIjIBkwqwJtqtFPI=
X-Received: by 2002:ae9:ed53:: with SMTP id c80mr6874474qkg.445.1576144301706;
 Thu, 12 Dec 2019 01:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20191127053836.31624-1-drake@endlessm.com>
In-Reply-To: <20191127053836.31624-1-drake@endlessm.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Thu, 12 Dec 2019 17:51:30 +0800
Message-ID: <CAD8Lp47zSV9hB8_qJv24YFae1bfE2LwqA_jChBQFpBOac5a2RA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: add generic quirk function for increasing
 D3hot delay
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux PCI <linux-pci@vger.kernel.org>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Linux Upstreaming Team <linux@endlessm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bjorn,

On Wed, Nov 27, 2019 at 1:38 PM Daniel Drake <drake@endlessm.com> wrote:
> Separate the D3 delay increase functionality out of quirk_radeon_pm() into
> its own function so that it can be shared with other quirks, including
> the AMD Ryzen XHCI quirk that will be introduced in a followup commit.
>
> Tweak the function name and message to indicate more clearly that the
> delay relates to a D3hot-to-D0 transition.

Any update on these pending patches?

Thanks
Daniel

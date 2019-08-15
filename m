Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9808EBED
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731935AbfHOMv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:51:26 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:41983 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729627AbfHOMv0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 08:51:26 -0400
Received: by mail-pg1-f171.google.com with SMTP id x15so1259954pgg.8
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w3lwlnbSg3L+Pu6TCsFwMwwEGrptN+bjq8fWg9ChFRc=;
        b=KXYRYE5y6OU8O7TYSxhrbO5QquIITdSsKdmHiLJNh7PeucX24bWrRJnQ3WLDvEyfk2
         ClD5JAdnaUDGcdjewM0uuP3+DY0oocWEgzD9f2pPOmEw0BIMIzrToe/mrauUKjoD5MQ/
         sTjZj6SdbJZX7Y0PgwFoDfnInReg+q6uNpfW5U2xEXrJ4FzVOL23zMiuxkczqbouN51r
         a9Q5evaXUZ075Clk3VncyrcflYCjDeuZih3YNor0T0XJ37+1/w6DCTahCgLikFrh4Nkr
         svYPM/EtW8IW60bR8ArLCX5wzEjQ12cixZBYH6XQ4qY9utJXu9JsLIwwg33k3kfDvOZv
         oIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w3lwlnbSg3L+Pu6TCsFwMwwEGrptN+bjq8fWg9ChFRc=;
        b=BVi/wbVDLT6qzeecxP3AmeI76+KFX7mvfIkLWHyDpAAY3+gP49UCBQyOyaYGqRQ/Yw
         RpnfDsqMs51EJdWm99VIvqq2uY8yj9/MfmLZG7vOrIC0n7CPYHdWA7eIAZw5TTKcF9lw
         cDySR3i7e1/I+oLvQ6ea7Z1GuYj3SdCQ4y6Gc+t49GW6i6VMF9/cJcPhzDhHbSFiU8jx
         JrEIpcU9x87g/BOSJTQh6wZ/xQFGNk6xya65v307srUDRVCFNkpd6yXAMgkOc7ZS+pc1
         DyCml+gg6cpL0nb20NEgBQqIpHoKbs50tWPXSAEupuJwNojxx2wcj7ik6TeZi0bfJ67n
         ECyg==
X-Gm-Message-State: APjAAAW5xD8a62ZS5oeodvp+5P+7WFEswcX38EXGwYhjqGRiABaNu3UN
        Zu3TF/W8GyjhmX8lXeKHQl8=
X-Google-Smtp-Source: APXvYqxUBzwWS5CozGvh0q7lQ8cDIRFiN3wqB9NPWpISiMaIlJ09vlcIW6VVgIKtBBs0oK6imDnQWQ==
X-Received: by 2002:a63:2447:: with SMTP id k68mr3435179pgk.219.1565873485418;
        Thu, 15 Aug 2019 05:51:25 -0700 (PDT)
Received: from [192.168.1.5] ([159.192.228.116])
        by smtp.googlemail.com with ESMTPSA id q4sm3085450pff.183.2019.08.15.05.51.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 05:51:25 -0700 (PDT)
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results in
 memory corruption
To:     Jonathan Bell <jonathan@raspberrypi.org>, linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>
References: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <0f259f36-4737-8a23-d39f-3a3b054aa753@gmail.com>
Date:   Thu, 15 Aug 2019 19:51:21 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/14/2019 22:59, Jonathan Bell wrote:
> There is a bug when the dwc2 core receives USB data packets that are
> between 1 and 4 bytes in length - 4 bytes are always written to memory
> where the non-packet bytes are garbage.

Which host controller driver, dwc2 or the out-of-tree dwc_otg driver?

Thanks
Lars

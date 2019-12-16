Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2D6121892
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 19:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfLPR4e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 12:56:34 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:41229 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbfLPR4b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 12:56:31 -0500
Received: by mail-wr1-f42.google.com with SMTP id c9so8408951wrw.8
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2019 09:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:mime-version:content-language
         :content-transfer-encoding;
        bh=/s6TihmZ1MJpgPFgkpLUeluSqsFU59M6lwAQBKgb7lw=;
        b=pPbkUsbYaRvzEvt2gLQ2LrmdmK4esVKUsy5ijFEEDOSlCs0XvwkVQ68kWcnc9qDV7F
         hO/Sp7PyxrQNaRlG2s68PhghhRgjBN5AaYvX+d2F/ww0OXsqzl3iz0k1hDHKvrmeLj+r
         O8a3fYeMENrTY9pa2sCxGh6cwCJLM1NFpNquqzSz6SiwMifxkqUnbIcHAUotRzOyBuiF
         Cpkb8UU4U8tQV3n1NxjJdUz8RXCz9cl3Au5bF5JVOs2eVEEPPqaUwL1WYUrx6+btrCBT
         WdaELp3EGpxnQA7gtjk1VLlRX+/A/wXudeoL1rNe2nuLqHe83GZH89xhEBUB7pJ5Lhu1
         iFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:mime-version
         :content-language:content-transfer-encoding;
        bh=/s6TihmZ1MJpgPFgkpLUeluSqsFU59M6lwAQBKgb7lw=;
        b=XFnbt0f5CdTy21B3NyV4jr+xS9s/P6fWqMcUpNXFfGqcOt4SbWB8VYYuSa77D01mZX
         ZIyqfsuxZYl8Cn9iJYC5gHN9/Sd6lGDs8M+JL5WptEOyUGA9yUY9HJHEhcQG0cWmRO/i
         VOfoyfAXzdydluHiZs0twn2M0Lls4XNgUP28350mwQrO9I0m2DEqvzMV2/bTavde4bvq
         y97YFScB2CCK7742XTUtqDKNnB1uItr79JHknMEuSr0kjp0HzbFw9x9vHnHYpBJDjRgX
         eF7PMHAv8jK4EMfJcVWXsbcx29rsQdJvH8wozu5OM6z69zxf91GT9MguPyyhWXjRkwrN
         798w==
X-Gm-Message-State: APjAAAWCw6xPUcGQaxBnmeK2PQItAClstLaFC7YTyHCrw9MsU6YwHlAe
        wYbHe79W4IQ6r8iM3RB1/wDgGag=
X-Google-Smtp-Source: APXvYqyZBmVr17iQdiXNriu5jmRAtPTnc7jczclmok4+AnzhlxWvFXZIn83P5W5r5QB6IXSlJfgn+Q==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr31458647wrt.343.1576518989185;
        Mon, 16 Dec 2019 09:56:29 -0800 (PST)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net. [88.12.24.118])
        by smtp.gmail.com with ESMTPSA id g2sm22282303wrw.76.2019.12.16.09.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 09:56:28 -0800 (PST)
To:     Oliver Neukum <oneukum@suse.com>,
        Stephanie Wallick <stephanie.s.wallick@intel.com>,
        "Sean O. Stalley" <sean.stalley@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
From:   Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: status of support for Media Agnostic USB
Message-ID: <91dbbedb-b014-b2c8-d398-b3ee70060e2e@gmail.com>
Date:   Mon, 16 Dec 2019 18:56:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum wrote:

> I recently hit upon some old patches for MA USB on the list.
> It looks like the discussion never went far. Is there anybody
> still interested in them? It looks like Windows 10 finally supports it
> and we are missing a feature.

Waiting... for internal review since 2014: https://marc.info/?l=linux-usb&m=141568079419684

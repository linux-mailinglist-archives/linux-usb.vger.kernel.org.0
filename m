Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1FD14A750
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 16:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbgA0PiG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 10:38:06 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41881 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgA0PiG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 10:38:06 -0500
Received: by mail-ed1-f66.google.com with SMTP id c26so11182034eds.8;
        Mon, 27 Jan 2020 07:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2oOiijjohxz95z3l06ec26DBQ9Nm+UrTMDZ4iY1OeNs=;
        b=QgaVMGi1Td76MnUXslUaQdCLt0u64WWZGzdr6sl9FibNS2CRrYBQy1WKjse6uzAxZ7
         mIuhR0sHNP6yD52qiHvCWH9wno6v8+MIvh1WL9vms4s5ftHgtKb5cJX8S5jdQfc5gV8z
         XoQWiDqF3MbAKWBu79wEZFfzcceiUNw9t2pTKnD/E4RlWJUWpGXEl+M3RRqKcy4rilSb
         14LVN0BoOXiXgUR9Vk1nfdUSQkOBTwE3VMvJt/LrFytIXzePJj3JD1oF4VMeJBeHbkHb
         hVrk9oyXjHL2GAOhVig5un5DMC7pkKoatCtq8NnOdjlMUh8+abawE9LE05yjQaqfD+1r
         8OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2oOiijjohxz95z3l06ec26DBQ9Nm+UrTMDZ4iY1OeNs=;
        b=iM1LxOBZQqjDC7T6iOMq36XvcfdiXlbZcDjlKQ2ipFGCgSh9Nw4a8a3r07Iifk4ana
         TiMG3qoYqrhUh+mxPPjwPYwLtQcUlpzobzH2kaQfWdUti1dcYDVa4J/GvU+IKUXY3JHR
         GHavDi2OntAnu95gJXySbDza8ficIumT6LdgsIa/v/ojnb0irPY3ritkyWrmbp/Y7Z0O
         jXfTprpkkiHk8Kjgi1c/16T8Q9z/CRkFQZGWnPmizUo4RfzS41tLGiuzNEO5fOQ4W7fz
         qRV1bCgv+E0+3X4uh9OHB0V421M2yFa52rrnqZfGu4jyCVqvCH88/oi5Wk2LQY4TJi9b
         I+FA==
X-Gm-Message-State: APjAAAVdZ1/9BZ6z+sNr1pLLtYeho8MOnoBooLagdMcOmt0QfFQAfTtL
        oOcnNAWFovXh42Cwg2UC7aaRzfeN
X-Google-Smtp-Source: APXvYqw/tdImVQ9ksiWIuD0zeCChWmgMQQn9qILMSGcbQxZ+HOj949ov2bejLZrBglaB/XTOgt6naA==
X-Received: by 2002:aa7:cd1a:: with SMTP id b26mr8485579edw.324.1580139484077;
        Mon, 27 Jan 2020 07:38:04 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id c25sm296251edy.39.2020.01.27.07.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:38:03 -0800 (PST)
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
To:     Peter Geis <pgwipeout@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <treding@nvidia.com>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200127023548.27107-1-pgwipeout@gmail.com>
 <20200127071758.GD279449@kroah.com>
 <CAMdYzYqctkfqhHN0-WDvX9kKdXH-AVir193SpcrR_t3K=VN=0w@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <76f6d7b6-f4de-c2ae-ce6b-28847666c477@gmail.com>
Date:   Mon, 27 Jan 2020 18:38:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMdYzYqctkfqhHN0-WDvX9kKdXH-AVir193SpcrR_t3K=VN=0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

27.01.2020 18:25, Peter Geis пишет:
> On Mon, Jan 27, 2020 at 2:18 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Sun, Jan 26, 2020 at 09:35:48PM -0500, Peter Geis wrote:
>>> The ci_hdrc_tegra driver does not currently support dual role mode, but
>>> it does not explicitly prevent its use.
>>> Certain devices support dual role mode, but not automatic role switch.
>>> This can cause the device to lock up during initialization of the
>>> driver.
>>>
>>> Detect this state by checking for the extcon phandle when dual role mode
>>> is set to otg.
>>> If it doesn't exist request the driver to only enable manual role
>>> switching.
>>>
>>> Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
>>
>> Please use 12 digits for kernel sha1 values, this should be:
>> Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
> 
> Understood, thank you.
> I will ensure that is the case in the future.

Please also take a look at the kernel's scripts/checkpatch.pl, running
'scripts/checkpatch.pl --strict path_to.patch' will help to catch such
things.

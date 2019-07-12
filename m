Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83B4F66997
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 11:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfGLJGr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Jul 2019 05:06:47 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40300 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfGLJGr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Jul 2019 05:06:47 -0400
Received: by mail-lj1-f196.google.com with SMTP id m8so8598966lji.7
        for <linux-usb@vger.kernel.org>; Fri, 12 Jul 2019 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wCz5SqCTGr+3tsf1r2Mnu7elwKj9sIBYciuRI8TQ3rc=;
        b=YQaQ3hd8WCEeQRIJqKdcIFhXlnbNDIcFChnrC+YVDEx1q2H/pcdTAgZ+GlTft1lrSv
         DGz5T3txg4v+4IXbBWdiwSCdWz3b260noP0v5uKDR7V85BWHI4sfWF4ueHDfP80N0NKK
         FapHxD6X7nflxXYJ7XJUtWA2Rk8UdnuTmMiAq/i9ItKxtgq0o8wo4ZY2jZ3EKARGG4CA
         TZX7M4U7q4IYE0SuNzy8tS/h3DSP3nBjVvBfAtCJmDiWZQc394WHGsK47je2rLRPnj2X
         k7xt1ZAWJGxEnjG7fTBoYhPzlPWiOIPkfjIIABgfBIgC2ekPCIPszpcBhNk/w8cEPwgn
         wAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wCz5SqCTGr+3tsf1r2Mnu7elwKj9sIBYciuRI8TQ3rc=;
        b=po47bjOWLsDTbAL/nBoz86/tyCFc+8WnTm4f/+nPzzd2h+i9VzOjO1m0B/r02MgCKH
         IBN3zoSsz7PiP9XQ1UpXKfPhGfDcrOo9GmKdoF0KZ15nEKmodhjttTbbYxswfzgsP2vD
         RWyuaH6BTcuadYHvk2rl3FFa21peST2hZEMT4rEikjoSGmUdIwWlOwcRAr2PLHhs977L
         juxzJ4CtVSvkRELBNEmQbDfTgmho2KBqS38ytrUS75VQam1gQZFDw9HtFEN0T8CtiRt/
         tITJmIBTdACrDILlkjb8hk+S/8fDpjqcl1tGTkEAfXyPRsgyj6LPExvK74FRgYej4cG2
         WX8A==
X-Gm-Message-State: APjAAAUIikKwWDJpMcbrzoZKj+D6Veu+8yjYpzKk3UCLElDhvnCoKGC5
        cB4Vo5N9V0a5IthmR3DYI6bRnA==
X-Google-Smtp-Source: APXvYqxVm/hXnU0e1m69vGlrh2Jk9YKXiyvnRlZFmMfoK4aoNfU4B1cWh2WkKXftUoOx3Y5wJGeDjg==
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr5173052ljs.54.1562922405363;
        Fri, 12 Jul 2019 02:06:45 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4891:7704:fc39:ac04:c327:315e? ([2a00:1fa0:4891:7704:fc39:ac04:c327:315e])
        by smtp.gmail.com with ESMTPSA id o8sm1352773ljh.100.2019.07.12.02.06.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 02:06:44 -0700 (PDT)
Subject: Re: [PATCH v2 04/12] usb: gadget: aspeed: Improve debugging when
 nuking
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
 <20190712025348.21019-5-benh@kernel.crashing.org>
 <af1da9a4-0122-4fdb-9fe7-fb886c19f3c7@cogentembedded.com>
Message-ID: <bbda0e6e-1710-f4e9-3b15-1a450566e4d4@cogentembedded.com>
Date:   Fri, 12 Jul 2019 12:06:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <af1da9a4-0122-4fdb-9fe7-fb886c19f3c7@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.07.2019 12:01, Sergei Shtylyov wrote:

>> When nuking requests, it's useful to display how many were
>> actually nuked. It has proven handy when debugging issues
>> where EP0 went in a wrong state.
>>
>> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> ---
>>   drivers/usb/gadget/udc/aspeed-vhub/core.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
>> b/drivers/usb/gadget/udc/aspeed-vhub/core.c
>> index db3628be38c0..0c77cd488c48 100644
>> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
>> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
>> @@ -65,13 +65,16 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct 
>> ast_vhub_req *req,
>>   void ast_vhub_nuke(struct ast_vhub_ep *ep, int status)
>>   {
>>       struct ast_vhub_req *req;
>> -
>> -    EPDBG(ep, "Nuking\n");
>> +    int count = 0;
>>       /* Beware, lock will be dropped & req-acquired by done() */
>>       while (!list_empty(&ep->queue)) {
>>           req = list_first_entry(&ep->queue, struct ast_vhub_req, queue);
>>           ast_vhub_done(ep, req, status);
>> +        count++;
>> +    }
>> +    if (count) {
>> +        EPDBG(ep, "Nuked %d request(s)\n", count);
> 
>     CodingStyle says to avoid {} around a single statement.

    I somehow missed this in v1 posting, sorry about that.

>>       }
>>   }

MBR, Sergei

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94A762F9FE
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 17:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241817AbiKRQOU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 11:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbiKRQOS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 11:14:18 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FE5EB8;
        Fri, 18 Nov 2022 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=a5qf2Dbj0dfxjuKlL0h+44D39XGNGKjGmP/kP3z2q8k=; b=FfaD7gUREmQ6u65SRj0pJUqAXF
        V9Pc6I0XDDneIiM8r+eEvYYN+1kllDQqRMwJl14I8R5xCQ2yZhCLvJwb7+dMwGTbaQAkbERUcvmA5
        2UjR2QGKihjgMyIz8F+r8F4Wgt2SuLYLH1ITLUErt8mxUmOrXVGFnOBBK7NdoFivTo2NlvqEZAzti
        bBuQbeCI4yOhTbSoYvNxvF1HhcsPWwZqY1fYqOnjkgJxid8VUcNlQlPAk7FQRIgFyrhWvFg51wRag
        v07q9Ru+wpufzXG73h4IxjqKvOZ9DIGe6VbRhpX91NFC4TfO8inWE3WU0dzFx+46lBUFtZJWQDaeb
        oo6AvZPw==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ow40N-005Cgc-Rn; Fri, 18 Nov 2022 16:14:15 +0000
Message-ID: <a2b9541e-2b3b-d8d4-6a6c-83bcea27f40a@infradead.org>
Date:   Fri, 18 Nov 2022 08:14:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Documentation: USB: correct possessive "its" usage
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20221118034331.18188-1-rdunlap@infradead.org>
 <Y3emeeetkgcGxNAO@rowland.harvard.edu>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Y3emeeetkgcGxNAO@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 11/18/22 07:36, Alan Stern wrote:
> On Thu, Nov 17, 2022 at 07:43:31PM -0800, Randy Dunlap wrote:
>> Correct uses of "it's" to possessive "its" as needed.
>> Correct associated grammar in one location.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: linux-usb@vger.kernel.org
>> ---
>>  Documentation/usb/CREDITS          |    4 ++--
>>  Documentation/usb/functionfs.rst   |    2 +-
>>  Documentation/usb/gadget_multi.rst |    2 +-
>>  3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff -- a/Documentation/usb/CREDITS b/Documentation/usb/CREDITS
>> --- a/Documentation/usb/CREDITS
>> +++ b/Documentation/usb/CREDITS
>> @@ -126,7 +126,7 @@ THANKS file in Inaky's driver):
>>          - Jochen Karrer <karrer@wpfd25.physik.uni-wuerzburg.de>, for
>>            pointing out mortal bugs and giving advice.
>>  
>> -        - Edmund Humemberger <ed@atnet.at>, for it's great work on
>> +        - Edmund Humemberger <ed@atnet.at>, for its great work on
>>            public relationships and general management stuff for the
>>            Linux-USB effort.
>>  
>> @@ -136,7 +136,7 @@ THANKS file in Inaky's driver):
>>          - Ric Klaren <ia_ric@cs.utwente.nl> for doing nice
>>            introductory documents (competing with Alberto's :).
>>  
>> -        - Christian Groessler <cpg@aladdin.de>, for it's help on those
>> +        - Christian Groessler <cpg@aladdin.de>, for its help on those
>>            itchy bits ... :)
>>  
> 
> Shouldn't this pronoun and the one above really be "his" rather than 
> either "it's" or "its"?
> 

Hi Alan,
Sure, I can do it that way.
Thanks.

> 
>>          - Paul MacKerras for polishing OHCI and pushing me harder for
>> diff -- a/Documentation/usb/functionfs.rst b/Documentation/usb/functionfs.rst
>> --- a/Documentation/usb/functionfs.rst
>> +++ b/Documentation/usb/functionfs.rst
>> @@ -49,7 +49,7 @@ level it would look like this::
>>    $ ( cd /dev/ffs-hid && hid-daemon ) &
>>  
>>  On kernel level the gadget checks ffs_data->dev_name to identify
>> -whether it's FunctionFS designed for MTP ("mtp") or HID ("hid").
>> +whether its FunctionFS is designed for MTP ("mtp") or HID ("hid").
>>  
>>  If no "functions" module parameters is supplied, the driver accepts
>>  just one function with any name.
>> diff -- a/Documentation/usb/gadget_multi.rst b/Documentation/usb/gadget_multi.rst
>> --- a/Documentation/usb/gadget_multi.rst
>> +++ b/Documentation/usb/gadget_multi.rst
>> @@ -9,7 +9,7 @@ The Multifunction Composite Gadget (or g
>>  that makes extensive use of the composite framework to provide
>>  a... multifunction gadget.
>>  
>> -In it's standard configuration it provides a single USB configuration
>> +In its standard configuration it provides a single USB configuration
>>  with RNDIS[1] (that is Ethernet), USB CDC[2] ACM (that is serial) and
>>  USB Mass Storage functions.
>>  

-- 
~Randy

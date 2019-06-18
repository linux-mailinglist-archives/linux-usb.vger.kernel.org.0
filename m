Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAD64A69A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 18:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbfFRQSE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 12:18:04 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43944 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbfFRQSE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 12:18:04 -0400
Received: by mail-pg1-f195.google.com with SMTP id f25so7946241pgv.10
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:references:user-agent:from:to:cc:subject:organization
         :in-reply-to:reply-to:address:date:message-id:mime-version;
        bh=RYFvOsIqWNKPXllIckoa16gRlAYcCjuMGbGl03Gjv+8=;
        b=iwIA1DnQoZ7r4Ul81VcNRfN71pZ4TBa04YHljr0tlGnrlSqGP21Vo7JrVshnuISTnk
         qyDfji4AZJIj2PjzUMbEUYu7EgeEcU56WE1D5mlvGsVElKQpfwGrr5aYSnW6MGV0Ery8
         LIubPO0105dgougkzi6HFg2qMhgCkP1nTZxpnKuWYclRFITStmbyVNtz0+9P7fzt29Gb
         tECn6Phuk0f6zSkKRIAn5I6ldUfIT3Styw3AqIR32APb+Sb9wIbHAk6NmhsWNxzj+idE
         BPrrv29JrPNCUcsaBks7TozxFlkns98qRdVIoE7eMHpXkVdc85xciCwvhLSNg6wp9w8G
         5xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:references:user-agent:from:to:cc:subject
         :organization:in-reply-to:reply-to:address:date:message-id
         :mime-version;
        bh=RYFvOsIqWNKPXllIckoa16gRlAYcCjuMGbGl03Gjv+8=;
        b=TAOhq0f2s58dyGp0/l7ngG9kEsjsB9rQUrpJmWKl+oP319YxZj8G/z86SRkQzDeXNv
         3cQHr15tDirqcw4AwfU/zqmzP2SdmRB2eJVaOA4FjX7JUrESA5cKPTiW+HbZCk8f2ubu
         NnRDfmr+sT3FCuijgVSKPI1/aCmPvApKrc41N7D2QvYlkzGTrA7CvEAI1PFc8grR5kz5
         Vg3SOMl534MiO1schtvGnpkze11eBrboh5AhpajVETvbfWau5qknR/x62byz7aVLx9Qa
         p1fIwJ/IGdELrdncqHHYMdL/LC21tqX6DnXwWWJBSPezFBpKtC72WHUf6zV4PcPeWQZi
         WcUg==
X-Gm-Message-State: APjAAAUZrtjyfpSEolQ7lZaDLNJOm/MblqZ6Lxl6jDznYX2HdNWHoWGf
        QC7Fd0EJ17bvE0PFTFAIZUkSkPjN78E=
X-Google-Smtp-Source: APXvYqw3umwA+t2EP/NERFYiCIegAzXioHog0Q0IbjbcVO/mkX1kgUZ6KgIZn6ur6Rk+PlmExN8WJQ==
X-Received: by 2002:a62:1b0c:: with SMTP id b12mr117095643pfb.230.1560874683401;
        Tue, 18 Jun 2019 09:18:03 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id p6sm28529059pgs.77.2019.06.18.09.18.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 09:18:02 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 012474650F3; Tue, 18 Jun 2019 09:18:01 -0700 (PDT)
References: <20190618153529.11418-1-dmg@turingmachine.org> <20190618160658.GA27611@kroah.com>
User-agent: mu4e 1.0; emacs 26.1
From:   dmg <dmg@turingmachine.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a, b) in adutux driver
Organization: turingMachine
In-reply-to: <20190618160658.GA27611@kroah.com>
Reply-To: dmg@turingmachine.org
Address: dmg@turingmachine.org
Date:   Tue, 18 Jun 2019 09:18:01 -0700
Message-ID: <87muiekgue.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Greg KH <gregkh@linuxfoundation.org> writes:

>>
>> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
>> index 9465fb95d70a..4a9fa3152f2a 100644
>> --- a/drivers/usb/misc/adutux.c
>> +++ b/drivers/usb/misc/adutux.c
>> @@ -379,7 +379,7 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
>>
>>  		if (data_in_secondary) {
>>  			/* drain secondary buffer */
>> -			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
>> +			int amount = min_t(size_t, bytes_to_read, data_in_secondary);
>
> Shouldn't amount and data_in_secondary be of size_t type?  Then you can
> just use min() here, right?


Hi Greg,

sorry,  I saw your comment to the other thread after I sent this one. I
agree. I'll address this issue.

Sorry for the wasted bandwidh, and thank you for the suggestion,

--dmg

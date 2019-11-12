Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E135F8F34
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 13:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfKLMDT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 07:03:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40367 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfKLMDT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Nov 2019 07:03:19 -0500
Received: by mail-wm1-f65.google.com with SMTP id f3so2662906wmc.5
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2019 04:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=vlR5BvN8fDVLS9FApCUjVrNYLWihEVkPHuXQcFm1HOM=;
        b=Gl8D7Px/DuXNhhILMOTUHvwI6EAry/B8/WWvhTYwHIvAHgPnMCa9Ccke/bzqAVQPUs
         E+90SjYC9jitp8M0j6nlabr9sbBm0pJkJXkiUKv1WAHSVUF6irVx1M2wHty/BzJL2fT7
         RzRfQEEV2xLNOuruLjDkNlDHABOtRdgiohjhVHCnV5tJCcvSnMxbTUQ4d78ql62Ui3BG
         3eJAg8wL0jpPWTOf+XNAHIqj0DQ7moAq2ywrlULiX2cky5njjIKIHXJvHWeKr/dQNzcv
         TVBO4WGpgWeuC3wH9AnnxsvJB5SKKZHK0pQS4/6NYeIvuen9He5/9iy3Z1cyPE05zCna
         cwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=vlR5BvN8fDVLS9FApCUjVrNYLWihEVkPHuXQcFm1HOM=;
        b=JdnQ0PuRJR/ltBTYC9Id8C51u1zWxXAkFrz6lqy0jhTwpTFXDaOzjw7L2ZdJa/psRS
         ZFz8QW6ImHiHmaqz5sa6Ss/B296IHQN9Fc8HzjBuW10TODprTR018jJq6Pnes9/W++gt
         YBk+T0a+8rJmdMod8qfcCvPh9KKGSV9iU2wUs5GhhG72lc7s+6hKTBAQMjgRKjIXf/6n
         mWRFoAmjMtL8N6Cs90tDBevBWGNXWqkkZhIWDI2+Q+ewRzmvefB7HE4yJaLRFKRBy0cQ
         8BMnaeMywFVy9JGCreFNGlYMNwH4/yZQ+CwTMQY7VmJHSk7SJHbwtYixAiH5xIfmwPZS
         S3Kg==
X-Gm-Message-State: APjAAAW2NaOGW9W0iusIxJCREC+l4WaBF+VP7ixSUcwZMhQhbyAi5BMu
        ipi+Y2hiQmqEfMy7BHqup9vsX6+P
X-Google-Smtp-Source: APXvYqxQ265HR3Vkqs1wSm09Qa5SEAEkwY9kIB52GagY2s11wdqrpeMzMEMFjZAZuU8yK7ppHh2n/A==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr3513950wma.71.1573560196805;
        Tue, 12 Nov 2019 04:03:16 -0800 (PST)
Received: from [109.186.90.35] (109-186-90-35.bb.netvision.net.il. [109.186.90.35])
        by smtp.gmail.com with ESMTPSA id o1sm21322349wrs.50.2019.11.12.04.03.15
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2019 04:03:15 -0800 (PST)
Message-ID: <5DCA9F82.1030204@gmail.com>
Date:   Tue, 12 Nov 2019 14:03:14 +0200
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: xhci-ring: "needs XHCI_TRUST_TX_LENGTH quirk" in kernel log
References: <5DCA343A.4000304@gmail.com> <553d3af1-dcd6-0db2-094d-64e7aa749e23@linux.intel.com>
In-Reply-To: <553d3af1-dcd6-0db2-094d-64e7aa749e23@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Thanks, this patch solves the issue, as one would expect.

However I'm under the impression that the underlying problem is only in 
the Event TRBs that arrive after the Event TRB of COMP_SHORT_PACKET 
type. In other words, the quirky behavior is only when the xHC flushes 
the Data TRBs that are left after the short packet has arrived, and 
sends faulty Event TRBs on their behalf.

So maybe ignore any Event TRB on behalf of a TD for which a 
COMP_SHORT_PACKET has been received? I mean, what information could it 
possibly contain?

This would also have solved the "Event TRB with no TDs queued" issue, 
just in a more generalized manner.

Regards,
    Eli

On 12/11/19 11:36, Mathias Nyman wrote:
> On 12.11.2019 6.25, Eli Billauer wrote:
>> Hello,
>>
>> Connecting a custom designed (on FPGA) USB 3.0 device to a Renesas 
>> uPD720202 (1912:0015) and kernel v5.3.0, I get a lot of messages in 
>> the kernel log, while transmitting data at a high bandwidth through a 
>> BULK IN endpoint:
>>
>> handle_tx_event: 36590 callbacks suppressed
>> xhci_hcd 0000:03:00.0: WARN Successful completion on short TX for 
>> slot 1 ep 18: needs XHCI_TRUST_TX_LENGTH quirk?
>> (last message repeated several times)
>>
>> The driver in charge, as reported by lspci, is xhci_hcd.
>>
>> Probably relevant details:
>>
>> * The buffer size of the USB transactions is 32 kiB and up (with 
>> libusb). With e.g. 16 kiB buffers these log messages don't appear.
>> * The device produces short packets occasionally. When only 
>> full-length packets are sent, these log messages don't appear.
>> * Other than these log messages, everything works fine. In 
>> particular, there are no errors in the data exchange in either 
>> situation.
>> * This problem doesn't happen when running the same test on an Intel 
>> B150 chipset’s USB 3.0 xHCI controller (8086:a12f).
>>
>> I don't really know what this warning means, but this whole thing 
>> kind-of reminds the "WARN Event TRB for slot x ep y with no TDs 
>> queued" issue that was solved recently. Just a wild guess.
>>
>
> It just means that we got an event from the xHC host saying the 
> transfer was
> completed with completion code "Success" even if we didn't get as many 
> bytes as was requested.
> Driver is expecting a completion code of Short Packet.
>
>> Any idea how this can be fixed?
>>
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 1e0236e90687..687182afc59b 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -228,6 +228,7 @@ static void xhci_pci_quirks(struct device *dev, 
> struct xhci_hcd *xhci)
>         }
>         if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
>             pdev->device == 0x0015) {
> +               xhci->quirks |= XHCI_TRUST_TX_LENGTH;
>                 xhci->quirks |= XHCI_RESET_ON_RESUME;
>                 xhci->quirks |= XHCI_ZERO_64B_REGS;
>         }
>
> You could give it a try and see if everything works normally.
>
> But this quirk is now quite common.
> Could make sense to get rid of it completely and just handle this case 
> as default driver behavior.
>
> -Mathias
>


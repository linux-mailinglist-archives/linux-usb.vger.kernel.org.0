Return-Path: <linux-usb+bounces-10897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45128FCE08
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 14:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23811C22052
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3D91AED2C;
	Wed,  5 Jun 2024 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="greITLfj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7631AED29
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589638; cv=none; b=AC+uTkBmn80QY2KpjiAFTWmBJ7jYzYJKgtCwmNjBhskBpYF5FTQNw50EBw1ithM03kuKZNFacN+1zepPUc3oxVsmHsJBg3raKstYxJnKrqVeCVFJEWYGqRYj/eu2LHZ3rfDE1VEmWRdMJCfLgUMSetKOEBT5Hswjov7yr3JHuq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589638; c=relaxed/simple;
	bh=hlWPMVk018+YWZw4dsn86sAQC1xQTkWSS/OIH5W/7LU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Lefo5kdomSETNJxxRdjpX0Sgy/OtwDtyz8M0OUK0hDzQiCgQWbsk7eNDdLBG8PxYYlHYJnfA3n/FgTI0ndQzZoxAhki3SFf7zdlAVuQhVQV7qUaIepWGQqCP/pmPPTNL/ixfmakZOeSwpAGadQdeMJtUErJ/+yftRXFGa5jswUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=greITLfj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a696cde86a4so184049266b.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2024 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717589634; x=1718194434; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb48j68aV1VEmgC0WdZicHVLTqyI/M1SXgckejTIYNQ=;
        b=greITLfjOyDVh3NaVDIY2m9tRg6OEGgILHb3V5uXdBuz6oTCp1Dhtt1ZPPfqt0VOgN
         w7cRVlA6Y7ozm6chal/hqCn/00B8WCwoMA6wfKBNvKJqjguhyUnPXmPaiMxArWIrO5Ig
         tRh4glcuTraZ/N+5hoQbe6Var2Er8s98AcVRlfwJSC2ZdSpshtmkHvLG80Ao5Bj7rBI8
         SG0RniAnRuL4g1RmDg8cmk5P5rZL9P8OpfQt7BH3dNdxd2MpuJy4vA8RdFOOyD/k9NYu
         kwiag8G4OTlGrpXCV6kpx1qksjVAIjfs5BApmtZIt+VruMMxcn2M8ofsmWyf9+5ADlfv
         Xf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589634; x=1718194434;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eb48j68aV1VEmgC0WdZicHVLTqyI/M1SXgckejTIYNQ=;
        b=WqvFjO/Bm1VSnIQrdGRQgmeEuBC2pYo37cusCaz7VHlodHw1gErjELUgcZFGaAlB47
         19VkQc5PLJ7uiPTtfywjGh0SY8M1wmebQH6PokgYW8aqVJbjNoQj4fnp4VBMNd8qVmmg
         8KKfmaa4blIRtJooRrHt2uqW1TRAd6D4ZUfSQSxFuwnD+JZ4GN3yaTvQtkTpxkXZ5LFr
         53Ge5Jfrv9fcsPdGnXNoAQCfHps9jTI0iu7+QgDvuq57gYeBpDREPX61ZcoKnrU5f21X
         uQVU4hvuru7C9aPEcLf9D33eOy8FIN5xbUEul5yyZcO28Dz3RbYCjk5OdV3lAzj+hrRG
         ZTnw==
X-Forwarded-Encrypted: i=1; AJvYcCVzdqAV4Y/z3SA1abI5A4/K86scNrN0YlyJbj/waUE/m0bpO9ePgt3AAaYT+psxRcQxTSuJU4wahI72CXinQR6VlWh3JDRadDJo
X-Gm-Message-State: AOJu0YxlGyOyXwlEzup0kw/4etloqOE7842ePHKLNg92IJ/vHtBqzdxg
	I70pJEZQd3IuKRM+Dl0Wh9vCwCmqokoJx8Jc681vT1loSBY6p7olmyS+MGHKe00=
X-Google-Smtp-Source: AGHT+IGcvEVUuygqJE5SU86F5k3RRUcYRKV+fqyRp5aGJ5spXac8kBddnI+eeL5r/kXrH6Y5RqPC9Q==
X-Received: by 2002:a17:906:f11a:b0:a6c:70c6:85aa with SMTP id a640c23a62f3a-a6c70c68badmr29903766b.62.1717589634263;
        Wed, 05 Jun 2024 05:13:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:bf01:c0fa:2aad:468a:2d84? ([2001:a61:139b:bf01:c0fa:2aad:468a:2d84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68c4e7e560sm601923566b.36.2024.06.05.05.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:13:53 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------w2IsZgmAGFUN0bCeDbsxw5B7"
Message-ID: <cf45b50d-9cbc-4408-a618-16d10054d25a@suse.com>
Date: Wed, 5 Jun 2024 14:13:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] usb: serial: Fix mos7840 resume from standby
To: Dmitry <d.smirnov@inbox.lv>, linux-usb@vger.kernel.org
Cc: Dmitry <dimonija@gmail.com>
References: <20240604225507.6801-1-d.smirnov@inbox.lv>
 <20240604225507.6801-2-d.smirnov@inbox.lv>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240604225507.6801-2-d.smirnov@inbox.lv>

This is a multi-part message in MIME format.
--------------w2IsZgmAGFUN0bCeDbsxw5B7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.24 00:55, Dmitry wrote:
> From: Dmitry <dimonija@gmail.com>

Sorry,

first thank you for the patch. It is good to see patches,
but that is a NACK.

Let me explain.

> ---
>   drivers/usb/serial/mos7840.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index 8b0308d84270..7443d2f018b4 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -770,6 +770,7 @@ static void mos7840_close(struct usb_serial_port *port)
>   		if (mos7840_port->write_urb_pool[j]) {
>   			kfree(mos7840_port->write_urb_pool[j]->transfer_buffer);
>   			usb_free_urb(mos7840_port->write_urb_pool[j]);
> +			mos7840_port->write_urb_pool[j] = NULL;

Why is that needed? It is a good idea, but is it needed?

>   		}
>   	}
>   
> @@ -1737,6 +1738,37 @@ static void mos7840_port_remove(struct usb_serial_port *port)
>   	kfree(mos7840_port);
>   }
>   
> +static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
> +{
> +    dev_dbg(&serial->interface->dev, "mos7840_suspend\n");
> +
> +    return 0;
> +}

You are providing a suspend() method that does nothing.

If we look at usbserial:

int usb_serial_suspend(struct usb_interface *intf, pm_message_t message)
{
         struct usb_serial *serial = usb_get_intfdata(intf);
         int i, r;

         /* suspend when called for first sibling interface */
         if (serial->suspend_count++)
                 return 0;

         /*
          * serial->type->suspend() MUST return 0 in system sleep context,
          * otherwise, the resume callback has to recover device from
          * previous suspend failure.
          */
         if (serial->type->suspend) {
                 r = serial->type->suspend(serial, message);
                 if (r < 0) {
                         serial->suspend_count--;
                         return r;
                 }
         }

         for (i = 0; i < serial->num_ports; ++i)
                 usb_serial_port_poison_urbs(serial->port[i]);

         return 0;
}
EXPORT_SYMBOL(usb_serial_suspend);

There is no point in doing so.


> +static int mos7840_resume(struct usb_serial *serial)
> +{
> +	struct moschip_port *mos7840_port;
> +	struct usb_serial_port *port;
> +	int i;
> +	dev_dbg(&serial->interface->dev, "mos7840_resume\n");
> +
> +	for (i = 0; i < serial->num_ports; ++i) {
> +		port = serial->port[i];
> +		if (!tty_port_initialized(&port->port))
> +			continue;
> +
> +		mos7840_port = usb_get_serial_port_data(port);
> +
> +		if (port->bulk_in_size)
> +			usb_submit_urb(mos7840_port->read_urb, GFP_NOIO);
This can fail.
And much worse, if this is necessary, the generic usbserial code does not handle
the resubmission of the read URB. If that is the case, it will not be killed if
the system suspends. That means if the suspend run fails further down the chain,
you will resubmit a running URB.

And, worse, there will be IO to a suspended device, which is very bad
and can corrupt memory with S4.
If you need to manage the URB in the individual driver you need to handle
it both upon suspend() and resume(). Hence you need some like the attached
patch in addition to your patch.

	Regards
		Oliver
--------------w2IsZgmAGFUN0bCeDbsxw5B7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-serial-Implement-suspend-for-mos7840.patch"
Content-Disposition: attachment;
 filename="0001-usb-serial-Implement-suspend-for-mos7840.patch"
Content-Transfer-Encoding: base64

RnJvbSA0OGI5ZThjYWM0OTc2MDg3N2IxNTNhMmIwYmVkYjBjMzRhMDQ2MGZhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBXZWQsIDUgSnVuIDIwMjQgMTQ6MTE6NDkgKzAyMDAKU3ViamVjdDogW1BBVENI
XSB1c2I6IHNlcmlhbDogSW1wbGVtZW50IHN1c3BlbmQgZm9yIG1vczc4NDAKClRoZSByZWFk
IFVSQiBuZWVkcyB0byBiZSBraWxsZWQgYmVmb3JlIHdlIHN1c3BlbmQuCgpTaWduZWQtb2Zm
LWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvdXNi
L3NlcmlhbC9tb3M3ODQwLmMgfCAxOCArKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL3NlcmlhbC9tb3M3ODQwLmMgYi9kcml2ZXJzL3VzYi9zZXJpYWwvbW9zNzg0
MC5jCmluZGV4IDc0NDNkMmYwMThiNC4uNzVjZjMzZGViMDJhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3VzYi9zZXJpYWwvbW9zNzg0MC5jCisrKyBiL2RyaXZlcnMvdXNiL3NlcmlhbC9tb3M3
ODQwLmMKQEAgLTE3NDAsOSArMTc0MCwyMSBAQCBzdGF0aWMgdm9pZCBtb3M3ODQwX3BvcnRf
cmVtb3ZlKHN0cnVjdCB1c2Jfc2VyaWFsX3BvcnQgKnBvcnQpCiAKIHN0YXRpYyBpbnQgbW9z
Nzg0MF9zdXNwZW5kKHN0cnVjdCB1c2Jfc2VyaWFsICpzZXJpYWwsIHBtX21lc3NhZ2VfdCBt
ZXNzYWdlKQogewotICAgIGRldl9kYmcoJnNlcmlhbC0+aW50ZXJmYWNlLT5kZXYsICJtb3M3
ODQwX3N1c3BlbmRcbiIpOworCWludCBpOworCXN0cnVjdCBtb3NjaGlwX3BvcnQgKm1vczc4
NDBfcG9ydDsKKwlzdHJ1Y3QgdXNiX3NlcmlhbF9wb3J0ICpwb3J0OworCWRldl9kYmcoJnNl
cmlhbC0+aW50ZXJmYWNlLT5kZXYsICJtb3M3ODQwX3N1c3BlbmRcbiIpOwogCi0gICAgcmV0
dXJuIDA7CisJZm9yIChpID0gMDsgaSA8IHNlcmlhbC0+bnVtX3BvcnRzOyArK2kpIHsKKwkJ
cG9ydCA9IHNlcmlhbC0+cG9ydFtpXTsKKwkJaWYgKCF0dHlfcG9ydF9pbml0aWFsaXplZCgm
cG9ydC0+cG9ydCkpCisJCQljb250aW51ZTsKKwkKKwkJbW9zNzg0MF9wb3J0ID0gdXNiX2dl
dF9zZXJpYWxfcG9ydF9kYXRhKHBvcnQpOworCisJCXVzYl9raWxsX3VyYihtb3M3ODQwX3Bv
cnQtPnJlYWRfdXJiKTsKKwl9CisJIHJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IG1vczc4
NDBfcmVzdW1lKHN0cnVjdCB1c2Jfc2VyaWFsICpzZXJpYWwpCkBAIC0xNzY2LDcgKzE3Nzgs
NyBAQCBzdGF0aWMgaW50IG1vczc4NDBfcmVzdW1lKHN0cnVjdCB1c2Jfc2VyaWFsICpzZXJp
YWwpCiAJCQl1c2Jfc3VibWl0X3VyYihtb3M3ODQwX3BvcnQtPnJlYWRfdXJiLCBHRlBfQVRP
TUlDKTsqLwogCX0KIAotICAgIHJldHVybiAwOworCXJldHVybiAwOwogfQogCiBzdGF0aWMg
c3RydWN0IHVzYl9zZXJpYWxfZHJpdmVyIG1vc2NoaXA3ODQwXzRwb3J0X2RldmljZSA9IHsK
LS0gCjIuNDUuMQoK

--------------w2IsZgmAGFUN0bCeDbsxw5B7--


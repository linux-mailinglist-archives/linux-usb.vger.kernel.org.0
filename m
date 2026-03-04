Return-Path: <linux-usb+bounces-33970-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMD+H30TqGnUngAAu9opvQ
	(envelope-from <linux-usb+bounces-33970-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:11:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD11FEC1C
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE693138F56
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 11:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D087039FCA5;
	Wed,  4 Mar 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YC2DJm5L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F851C84AB
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622484; cv=none; b=f70LfJ4Opat6Oys3u2Svqi9nwvDs0bNdLP/3PFpNGbJpvZovRxEEksdmWxXSc6m/vwCJhVFKMy4k4XtOo9GXHH5CNZN/4BeZ3e3fkhiQBhkgzKhKqIgLaVpL0AWipHufUVaHSGka7sfYiM8cLo/GQutbVrVStjlJQBkrk1u//Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622484; c=relaxed/simple;
	bh=MqR618vUskxcz9JqcOuaxzLICh5XKOW1wOrrjJ073Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsyyLduOyUZtkPhxPoa1FFB0/9yGF74SMKsrNwLO2WW5xE5+Bc7miOX2mdsVQOJ3nQRmYY8ureInzHBRh7yzCd5vqNuuzKMMBJZFlL/9nzzvtTjK/zpwHdaTnsCqLskWbgHbBtmNrRPBbtvtyothCrnGBgx7NhSZCGMZ/LI3560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YC2DJm5L; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso56701455e9.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 03:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772622481; x=1773227281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTucieT2brvHlyNLxWqi/FWnFz/6i/21uMod3Iz4R3A=;
        b=YC2DJm5LSLHcGO2N2TTvbQmdRYr86ndVQ+6QJm36iupRYwB0VC5ansexQnKPXpoYQ+
         xjyKbwhjsuEKNssqaqVgU68CxenZvJ0AHTn/2ihza1srxpcxLa/6hyLiz+XgfW0WMsdK
         mFMzwhY7eaCyZSjNOHZHO3BP1tbssxXmP0loXjV+EANs9hBLVpRj7hOrsum5pW+21TYH
         mIC7MHuh2eeUoXKNkZvKmObqbbZLba0Ysr0H2hNrn4FpYre9EJZVVerirq4SMLpX7t3R
         Q2LOQfLNY1lkh+onyGncM7LX+329zihcj2BqPQN4DTxtfji14IG5u/k/OZOu2zQ/0Hrc
         y2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622481; x=1773227281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTucieT2brvHlyNLxWqi/FWnFz/6i/21uMod3Iz4R3A=;
        b=lkIO0Y/j3AhtDF94BEbDZ/JlOVOPg7/vjS91Y6JCwKr8wMjfpief48SOkKIFRcEIr/
         lC24+WHA8+91kHQx6aD5rYPjFx+psbd9xYxPH5IQBkoKM8jo4IMIqcXd2UkiWxi6T04V
         Pn66JlvpAtl5WiyyrDGTPietP9mYKSR7CBpPTWtOE3aFDiYjh2aD6/zGhtKDF1RMjPuz
         zB9wzgD7KUPUp4PHjnpUdU6e5f0z9m843vZd/RqRZVG8Ar6ZA6Z4sUCoKtFdYpo0DDxf
         FJ39CbGCjsJnhOkg2zD3rdMcCVIl6dFxWxoJH6aK5hXE9WiLXO5U0mIi+Bk+8YRX5N1q
         P3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2twYrPF1MQ96Q9MG8vzWZZJJnsIArRfemjL50sNd8y9nSDvhmfekIsHapIiHv9xKukonuWNeEwWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO2ao8vsMtl2JiZFKoDa1fnwkYMGNquLTzZ06aLbU7EvhGhd+5
	9efG2lbehdCvfxn8TzU2RxjM/sDcjsaJAZmh/hfo/BEA1fecMoaMSn4k5IPR3G2sn7E4TXENtFb
	N5Siq
X-Gm-Gg: ATEYQzxn18WNQEVXqEulH37kEhin8cFire62vxKbN+AYoxB/qJXb+AewI0wvPZbAPxx
	o9CPUspCmXtheN3w04TEKqXRyj5JYY9CwdfAdSAjPcRKCmtOAOABuz1REEOtKyrhZekHCjenQOQ
	WluvpILYQ0Jk0d1sOhca0mhH+vcsAFjOEQna3bNW82cmYPsgESHRkqwDg4LnFWPAXMAdcl8ULEf
	/qHjuzovdzw9/MnablcThls7/8BHoZ7K7TnY8hK180fvIXhfjkyWq4c3bX0+qk5HYExDLcgk5qf
	tmtJ95xQAzWJ/byTcS6PN0Gg4J8YKI/whwhQttZ6exVQtxSqdQs1uWcOtPUpwUgVKzstCYzyTLb
	0pGtiZbj+3u/NvS1M3a0z8x4Mvv1SGKID1J5Vz5gAS4hlDhCfM+pa94dgWOlwYV42JpAnS6ikx4
	P7l8QPOG710JaSpJz3/1tlhJYw4NXZn0zOvXtQ7/l++deAVWETWBjPn2uWYTkv8Flzu8mO
X-Received: by 2002:a05:600c:3b29:b0:483:7980:4687 with SMTP id 5b1f17b1804b1-48519899381mr28044505e9.17.1772622480990;
        Wed, 04 Mar 2026 03:08:00 -0800 (PST)
Received: from ?IPV6:2a02:3033:26c:d55c:3b10:49f7:caf4:851f? ([2a02:3033:26c:d55c:3b10:49f7:caf4:851f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851acfe884sm10583145e9.7.2026.03.04.03.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:08:00 -0800 (PST)
Message-ID: <cb5abe7e-8795-46d0-b5cd-66e1bf34fd49@suse.com>
Date: Wed, 4 Mar 2026 12:07:59 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] USB: serial: nct_usb_serial: add support for Nuvoton
 USB adapter
To: hsyemail2@gmail.com, Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Sheng-Yuan Huang <syhuang3@nuvoton.com>
References: <aPem-8w3LLkP_r2d@hovoldconsulting.com>
 <20260304080929.10179-1-syhuang3@nuvoton.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260304080929.10179-1-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 01FD11FEC1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33970-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:dkim,suse.com:mid]
X-Rspamd-Action: no action

Hi,

thank you for the submission.

On 04.03.26 09:09, hsyemail2@gmail.com wrote:

> +static int nct_tiocmset_helper(struct tty_struct *tty, unsigned int set,
> +			       unsigned int clear)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_ctrl_msg msg;
> +	struct nct_vendor_cmd cmd;
> +	u8 hcr;
> +
> +	spin_lock_irq(&tport->port_lock);
> +	hcr = tport->hcr;
> +
> +	if (set & TIOCM_RTS)
> +		hcr |= NCT_HCR_RTS;
> +	if (set & TIOCM_DTR)
> +		hcr |= NCT_HCR_DTR;
> +	if (clear & TIOCM_RTS)
> +		hcr &= ~NCT_HCR_RTS;
> +	if (clear & TIOCM_DTR)
> +		hcr &= ~NCT_HCR_DTR;
> +
> +	tport->hcr = hcr;
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_HCR, tport->hw_idx);
> +	msg.val = cpu_to_le16(hcr);
> +	spin_unlock_irq(&tport->port_lock);

What exactly are you locking with that spinlock against?
You are keeping it held after setting tport->hcr

> +	return nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> +}

> + *  Starts reads urb on all ports. It is to avoid potential issues caused by
> + *  multiple ports being opened almost simultaneously.
> + *  It must be called AFTER startup, with urbs initialized.
> + *  Returns 0 if successful, non-zero error otherwise.
> + */
> +static int nct_startup_device(struct usb_serial *serial)
> +{
> +	int ret;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_serial_port *port;
> +	unsigned long flags;
> +	bool first_open = false;
> +
> +	/* Start URBs on first open */
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	if (serial_priv->open_count++ == 0)
> +		first_open = true;
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);

And here we have a problem. At this time a concurrent opener
can run and read open_count
> +
> +	/* Only the first open submits read_urb and, if needed, interrupt_in_urb. */
> +	if (!first_open)
> +		return 0;

That means that a concurrent opener can return here, without the URB
having been submitted.

> +	/* Start reading from bulk in endpoint */
> +	port = serial->port[0];
> +	ret = usb_submit_urb(port->read_urb, GFP_KERNEL);
> +	if (ret) {
> +		dev_err(&port->dev, "failed to submit read urb: %d\n", ret);
> +		goto err_rollback;

Here you handle errors.

> +	}
> +
> +	/* For getting status from interrupt-in */
> +	if (!serial_priv->use_bulk_status) {
> +		/* Start reading from interrupt pipe */
> +		port = serial->port[0];
> +		ret = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
> +		if (ret) {
> +			dev_err(&port->dev,
> +				"failed to submit interrupt urb: %d\n",
> +				ret);
> +			goto err_kill_read;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_kill_read:
> +	usb_kill_urb(serial->port[0]->read_urb);
> +err_rollback:
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);

Taking the lock again

> +	if (serial_priv->open_count)
> +		serial_priv->open_count--;

Too late

> +	if (!serial_priv->open_count) {
> +		serial_priv->cur_port = NULL;
> +		serial_priv->cur_len = 0;
> +	}
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +	return ret;
> +}

If a second call to open() races with a primary open() that fails,
we'll end up with the first open() failing, as it should, but the
second one succeeds, although it also has to fail with an error return.

It seems to me that the obvious fix is to add a mutex that needs to be held
throughout nct_startup_device() and nct_shutdown_device()


> +static int nct_open(struct tty_struct *tty, struct usb_serial_port *port)
> +{
> +	struct nct_vendor_cmd cmd;
> +	struct nct_ctrl_msg msg;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	int ret;
> +
> +	if (!port->serial)
> +		return -ENXIO;
> +
> +	/* Be sure the device is started up */
> +	if (nct_startup_device(port->serial) != 0)
> +		return -ENXIO;
> +
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_OPEN_PORT, tport->hw_idx);
> +	msg.val = cpu_to_le16(0);
> +	ret = nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));

Likewise. If two calls to open() are racing, the second one will
return before you send NCT_VCOM_SET_OPEN_PORT to the device.

> +	if (ret) {
> +		dev_err(&port->dev, "Failed to open port: %d\n", ret);
> +		nct_shutdown_device(serial);
> +		return ret;
> +	}
> +
> +	wake_up_interruptible(&port->port.open_wait);
> +
> +	/*
> +	 * Delay 1ms for firmware to configure hardware after opening the port.
> +	 * (Especially at high speed)
> +	 */
> +	usleep_range(1000, 2000);
> +	return 0;
> +}

	Regards
		Oliver



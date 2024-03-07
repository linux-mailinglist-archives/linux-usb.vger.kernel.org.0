Return-Path: <linux-usb+bounces-7678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AEE8753CD
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 17:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 994ED282A04
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 16:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB76B12F58F;
	Thu,  7 Mar 2024 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3dBbAM7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBEB1EB41
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709827453; cv=none; b=AeuHhtf6rbP5+SU1P2fatEgKTdktBHimKgp1yae0nUJYoQHWMsw1Q/47E7Q3fVvUDGhw12xhGTzlAijkHpy9R85VuXcARuj9f3nmzg0OVZIQHHJ8oSl1D1blbnCHKbtxEqlq1MIbiFFiuSevUD/C5k4v3+bzak5d62I1x0Us0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709827453; c=relaxed/simple;
	bh=fEGVVHJEx6mtihSJTGl6EcYa9lgpWQf51rU71pRdZNw=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc:
	 References:In-Reply-To; b=BMEOfVxCBbhiT4VSZC4yDRv8sr3EjV3AGXDOXkKaemUbD4lKqKlda5z+JGnonsg6y2ZsXut3evwbuEabBAss1MlPHxsN7Hy4zJmxf5bmlmWGkbBloer035otxNuW68NbhwfDMLhLlVMquoh7z8PasY7OCdCvR5KEe3+h6xZeBUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3dBbAM7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513173e8191so1313769e87.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Mar 2024 08:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709827449; x=1710432249; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdy2z3yCX0OBhhxRO8yYawcZQvodT1FOVCnVLe7Sji0=;
        b=d3dBbAM7EmzEJEVQE3eaURXKNvVv7qUMqlTxwbuc5yskpa7Sthm02PaexD4OowG1Jo
         PS81mCYg7J4+p6rr3AhVID3EV321HBHuEwdnUb/8fM7vMjghMltkRPQMlu4uiOE+0M/t
         94lVZRVLsM7ewDprflbgfwXHIKpaWSMbCpRF1+4ZIjBLeFs1DrRSq5UxrZLSARRhrLEL
         szKKBAVT8KSLkY/+C79SyFLalsoVB1yKFIGdZPNOHNART3WqhssuSqtnOzJRoSdZan3z
         wOyEAZDX/XW3vUxJJESz0vObmfBExoNNe1wDc3aQ/yjm7r/sisi83uwEXG/APHc8Vryh
         Zw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709827449; x=1710432249;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zdy2z3yCX0OBhhxRO8yYawcZQvodT1FOVCnVLe7Sji0=;
        b=LYp4je+UI8Jl0M4bNkb0gHOS/RnkabYZnB2p1H37jF4nMTopMzceinwgi2y9n/z3QM
         qmG9mylm4pQftwXM7psZ4NfoK1O7eqlgDyIY/z0rIq/YVP+pcJqy1z07qyphUG0ljgaN
         yfzR7BlZwyFPPjOC/HwioPPSE3C/YjaGv+w65458U2r7FPhcrJ0qKFEjcghrfPcXlUFa
         NcsFrrOpQojv6IFLzdkaUq2gKqJ05Df6NustVnxaxJvDg84zMsYdr186gCVxkh93CxgB
         lhVOX68vjB45cjZE+YJgx/lvqQDvp2a8kX9SREM0jWzjOgZ7LU95fadUQ/lXhfZ1lzDx
         bjSA==
X-Gm-Message-State: AOJu0YzNC0hTDhMr0zF4MtpnL00FSxspFFM1Y37cOqGl+pr6Wg4W/VeQ
	B3DqmmJtPIGZSb+jCnzzyKDpQbSvSO6kAMvBJ4f4Rgjyq5a35+LLkRJlOGrc4GY=
X-Google-Smtp-Source: AGHT+IHU/zXnGc6dUcf17fyT6ImupCLBnjWtCKaqyO5CnnsTph6nUMhyu3ndlqvNJ8uMLJCITBf+Cw==
X-Received: by 2002:a19:8c1c:0:b0:513:8cfa:97d7 with SMTP id o28-20020a198c1c000000b005138cfa97d7mr188934lfd.8.1709827448036;
        Thu, 07 Mar 2024 08:04:08 -0800 (PST)
Received: from ?IPV6:2001:678:a5c:1204:db7b:6df3:1a86:f66a? (soda.int.kasm.eu. [2001:678:a5c:1204:db7b:6df3:1a86:f66a])
        by smtp.gmail.com with ESMTPSA id be31-20020a056512251f00b00512cd303055sm3117874lfb.33.2024.03.07.08.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 08:04:07 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------6SWjO40PObieEso7p0DwfJTl"
Message-ID: <7e92369a-3197-4883-9988-3c93452704f5@gmail.com>
Date: Thu, 7 Mar 2024 17:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH v2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240223140305.185182-1-mathias.nyman@linux.intel.com>
Content-Language: en-US, sv-SE
In-Reply-To: <20240223140305.185182-1-mathias.nyman@linux.intel.com>

This is a multi-part message in MIME format.
--------------6SWjO40PObieEso7p0DwfJTl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2024-02-23 15:03, Mathias Nyman wrote:
> Ports with  _UPC (USB Port Capability) ACPI objects stating they are
> "not connectable" are not wired to any connector or internal device.
> They only exist inside the host controller.
> 
> These ports may not have an ACPI _PLD (Physical Location of Device)
> object.
> 
> Rework the code so that _UPC is read even if _PLD does not exist, and
> make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
> of "USB_PORT_CONNECT_TYPE_UNKNOWN".
> 
> No bugs or known issues are reported due to possibly not parsing _UPC,
> and thus leaving the port connect type as "unknown" instead of
> "not used". Nice to have this fixed but no need to add it to stable
> kernels, or urgency to get it upstream.

With this patch (f3ac348e6e04501479fecf55250b25ff2092540b in 
next-20240307), my machine fails to boot. I was able to get some kernel 
console output from the pstore when compiling USB support as a module 
instead of built in. Reverting it on top of next-20240307 resolves the 
issue for me.

Please tell me if there's anything else you need.

Kind regards,
Klara Modin

> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
> v1 -> v2
>    - Commit message improvements
>    - send patch separately for easier picking to usb-next
> 
>   drivers/usb/core/usb-acpi.c | 46 ++++++++++++++++++-------------------
>   1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index a34b22537d7c..f250dfc3b14d 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -142,12 +142,19 @@ int usb_acpi_set_power_state(struct usb_device *hdev, int index, bool enable)
>   }
>   EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
>   
> -static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
> -		struct acpi_pld_info *pld)
> +/*
> + * Private to usb-acpi, all the core needs to know is that
> + * port_dev->location is non-zero when it has been set by the firmware.
> + */
> +#define USB_ACPI_LOCATION_VALID (1 << 31)
> +
> +static void
> +usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
>   {
>   	enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
>   	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>   	union acpi_object *upc = NULL;
> +	struct acpi_pld_info *pld;
>   	acpi_status status;
>   
>   	/*
> @@ -158,6 +165,12 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
>   	 * a usb device is directly hard-wired to the port. If no visible and
>   	 * no connectable, the port would be not used.
>   	 */
> +
> +	status = acpi_get_physical_device_location(handle, &pld);
> +	if (ACPI_SUCCESS(status) && pld)
> +		port_dev->location = USB_ACPI_LOCATION_VALID |
> +			pld->group_token << 8 | pld->group_position;
> +
>   	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
>   	if (ACPI_FAILURE(status))
>   		goto out;
> @@ -166,25 +179,22 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
>   	if (!upc || (upc->type != ACPI_TYPE_PACKAGE) || upc->package.count != 4)
>   		goto out;
>   
> +	/* UPC states port is connectable */
>   	if (upc->package.elements[0].integer.value)
> -		if (pld->user_visible)
> +		if (!pld)
> +			; /* keep connect_type as unknown */
> +		else if (pld->user_visible)
>   			connect_type = USB_PORT_CONNECT_TYPE_HOT_PLUG;
>   		else
>   			connect_type = USB_PORT_CONNECT_TYPE_HARD_WIRED;
> -	else if (!pld->user_visible)
> +	else
>   		connect_type = USB_PORT_NOT_USED;
>   out:
> +	port_dev->connect_type = connect_type;
>   	kfree(upc);
> -	return connect_type;
> +	ACPI_FREE(pld);
>   }
>   
> -
> -/*
> - * Private to usb-acpi, all the core needs to know is that
> - * port_dev->location is non-zero when it has been set by the firmware.
> - */
> -#define USB_ACPI_LOCATION_VALID (1 << 31)
> -
>   static struct acpi_device *
>   usb_acpi_get_companion_for_port(struct usb_port *port_dev)
>   {
> @@ -222,22 +232,12 @@ static struct acpi_device *
>   usb_acpi_find_companion_for_port(struct usb_port *port_dev)
>   {
>   	struct acpi_device *adev;
> -	struct acpi_pld_info *pld;
> -	acpi_handle *handle;
> -	acpi_status status;
>   
>   	adev = usb_acpi_get_companion_for_port(port_dev);
>   	if (!adev)
>   		return NULL;
>   
> -	handle = adev->handle;
> -	status = acpi_get_physical_device_location(handle, &pld);
> -	if (ACPI_SUCCESS(status) && pld) {
> -		port_dev->location = USB_ACPI_LOCATION_VALID
> -			| pld->group_token << 8 | pld->group_position;
> -		port_dev->connect_type = usb_acpi_get_connect_type(handle, pld);
> -		ACPI_FREE(pld);
> -	}
> +	usb_acpi_get_connect_type(port_dev, adev->handle);
>   
>   	return adev;
>   }
--------------6SWjO40PObieEso7p0DwfJTl
Content-Type: text/x-log; charset=UTF-8; name="no-boot-bisect.log"
Content-Disposition: attachment; filename="no-boot-bisect.log"
Content-Transfer-Encoding: base64

IyBiYWQ6IFsxODQzZTE2ZDJkZjlkOTg0MjdlZjgwNDU1ODk1NzE3NDlkNjI3Y2Y3XSBBZGQg
bGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAyNDAzMDcKZ2l0IGJpc2VjdCBzdGFy
dCAnbmV4dC9tYXN0ZXInCiMgc3RhdHVzOiB3YWl0aW5nIGZvciBnb29kIGNvbW1pdChzKSwg
YmFkIGNvbW1pdCBrbm93bgojIGdvb2Q6IFs2N2JlMDY4ZDMxZDQyM2I4NTdmZmQ4YzM0ZGJj
YzA5M2Y4ZGZmZjc2XSBNZXJnZSB0YWcgJ3Zmcy02LjgtcmVsZWFzZS5maXhlcycgb2YgZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Zmcy92ZnMKZ2l0
IGJpc2VjdCBnb29kIDY3YmUwNjhkMzFkNDIzYjg1N2ZmZDhjMzRkYmNjMDkzZjhkZmZmNzYK
IyBnb29kOiBbMWEwYTMzZTIyZTcxNWE0Y2M3YmIyNzA5Y2ZkYThlODNiOGM3NTZiMl0gTWVy
Z2UgYnJhbmNoICdtYWluJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbmV0ZGV2L25ldC1uZXh0LmdpdApnaXQgYmlzZWN0IGdvb2QgMWEwYTMz
ZTIyZTcxNWE0Y2M3YmIyNzA5Y2ZkYThlODNiOGM3NTZiMgojIGdvb2Q6IFtkOTYyOTY1MDgx
NzJlOGQ4OTIwM2M0NWUyYWZiZWNmYTZlNmY1YWIwXSBNZXJnZSBicmFuY2ggJ21hc3Rlcicg
b2YgZ2l0Oi8vd3d3LmxpbnV4LXdhdGNoZG9nLm9yZy9saW51eC13YXRjaGRvZy1uZXh0Lmdp
dApnaXQgYmlzZWN0IGdvb2QgZDk2Mjk2NTA4MTcyZThkODkyMDNjNDVlMmFmYmVjZmE2ZTZm
NWFiMAojIGJhZDogWzIzZDNhYzNmMTczZWQ2NWVhYTk5NmI1ZjM3MjMyOTY2N2ZhZTNhYmFd
IE1lcmdlIGJyYW5jaCAndXNiLW5leHQnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9qb2hhbi91c2Itc2VyaWFsLmdpdApnaXQgYmlzZWN0IGJh
ZCAyM2QzYWMzZjE3M2VkNjVlYWE5OTZiNWYzNzIzMjk2NjdmYWUzYWJhCiMgZ29vZDogWzYy
MWY5MDljMDYwYmM2ZmVlMmI4NmVkNjcxNmExZWJkZmQxZDVlZmZdIE1lcmdlIGJyYW5jaCAn
bWFzdGVyJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdGlwL3RpcC5naXQKZ2l0IGJpc2VjdCBnb29kIDYyMWY5MDljMDYwYmM2ZmVlMmI4NmVk
NjcxNmExZWJkZmQxZDVlZmYKIyBnb29kOiBbMjEwZThkZjQ3N2IyYjgzNGUwZmEwYTBkODY1
NTlkNjA4MGQ4ZWM0Ml0gTWVyZ2UgYnJhbmNoICduZXh0JyBvZiBodHRwczovL2dpdGh1Yi5j
b20va3ZtLXg4Ni9saW51eC5naXQKZ2l0IGJpc2VjdCBnb29kIDIxMGU4ZGY0NzdiMmI4MzRl
MGZhMGEwZDg2NTU5ZDYwODBkOGVjNDIKIyBiYWQ6IFs4MmU4MjEzMGE3OGI3NWE5Y2U1MjI1
ZGYyNGQ1YTBiMWIzMjkwZWIwXSB1c2I6IGNvcmU6IFNldCBjb25uZWN0X3R5cGUgb2YgcG9y
dHMgYmFzZWQgb24gRFQgbm9kZQpnaXQgYmlzZWN0IGJhZCA4MmU4MjEzMGE3OGI3NWE5Y2U1
MjI1ZGYyNGQ1YTBiMWIzMjkwZWIwCiMgZ29vZDogWzVlN2VhNjVkYWYxM2E5NWE2Y2M2M2Qx
Mzc3ZTRjNTAwZTRlMTM0MGZdIHVzYjogZ2FkZ2V0OiB1dmM6IHJlZmFjdG9yIHRoZSBjaGVj
ayBmb3IgYSB2YWxpZCBidWZmZXIgaW4gdGhlIHB1bXAgd29ya2VyCmdpdCBiaXNlY3QgZ29v
ZCA1ZTdlYTY1ZGFmMTNhOTVhNmNjNjNkMTM3N2U0YzUwMGU0ZTEzNDBmCiMgZ29vZDogWzcz
NDczYjMwMzNhNjMzZDY0MGVmMDY1YWE5OGQ2MGZiZTJkNDBkZGJdIE1lcmdlIHRhZyAndGh1
bmRlcmJvbHQtZm9yLXY2LjktcmMxJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvd2VzdGVyaS90aHVuZGVyYm9sdCBpbnRvIHVzYi1uZXh0Cmdp
dCBiaXNlY3QgZ29vZCA3MzQ3M2IzMDMzYTYzM2Q2NDBlZjA2NWFhOThkNjBmYmUyZDQwZGRi
CiMgZ29vZDogWzQxNzE3Yjg4YWJmMWNhY2Q5NTNlOWVhMmFjZTJmNjJlYWY3NjNjNDhdIHVz
YjogZHdjMzogcWNvbTogUmVtb3ZlIEFDUEkgc3VwcG9ydCBmcm9tIGdsdWUgZHJpdmVyCmdp
dCBiaXNlY3QgZ29vZCA0MTcxN2I4OGFiZjFjYWNkOTUzZTllYTJhY2UyZjYyZWFmNzYzYzQ4
CiMgYmFkOiBbOGQzNmMwZTQzM2UwODA3NzAwZmU5Njc5NTNmOGIwYmViMGRjNTE1OV0gdXNi
OiBkd2MzOiBvZi1zaW1wbGU6IEFkZCBjb21wYXRpYmxlIGZvciBoaTM3OThtdjIwMCBEV0Mz
IGNvbnRyb2xsZXIKZ2l0IGJpc2VjdCBiYWQgOGQzNmMwZTQzM2UwODA3NzAwZmU5Njc5NTNm
OGIwYmViMGRjNTE1OQojIGJhZDogWzRkMGE1YTk5MTU3OTMzNzdjMGZlMWE4ZDc4ZGU2YmNk
OTJjZWE5NjNdIHVzYjogdHlwZWM6IHVjc2k6IENsZWFuIHVwIFVDU0lfQ0FCTEVfUFJPUCBt
YWNyb3MKZ2l0IGJpc2VjdCBiYWQgNGQwYTVhOTkxNTc5MzM3N2MwZmUxYThkNzhkZTZiY2Q5
MmNlYTk2MwojIGJhZDogWzBlMjg3OTAxOTVmYTY1ZmRlNDFmYTEyN2E4OWUwOTAzMzg4ZjYy
ODVdIHVzYjogdHlwZWM6IHRjcG06IGZpeCBTT1AnIHNlcXVlbmNlcyBpbiB0Y3BtX3BkX3N2
ZG0KZ2l0IGJpc2VjdCBiYWQgMGUyODc5MDE5NWZhNjVmZGU0MWZhMTI3YTg5ZTA5MDMzODhm
NjI4NQojIGJhZDogW2YzYWMzNDhlNmUwNDUwMTQ3OWZlY2Y1NTI1MGIyNWZmMjA5MjU0MGJd
IHVzYjogdXNiLWFjcGk6IFNldCBwb3J0IGNvbm5lY3QgdHlwZSBvZiBub3QgY29ubmVjdGFi
bGUgcG9ydHMgY29ycmVjdGx5CmdpdCBiaXNlY3QgYmFkIGYzYWMzNDhlNmUwNDUwMTQ3OWZl
Y2Y1NTI1MGIyNWZmMjA5MjU0MGIKIyBmaXJzdCBiYWQgY29tbWl0OiBbZjNhYzM0OGU2ZTA0
NTAxNDc5ZmVjZjU1MjUwYjI1ZmYyMDkyNTQwYl0gdXNiOiB1c2ItYWNwaTogU2V0IHBvcnQg
Y29ubmVjdCB0eXBlIG9mIG5vdCBjb25uZWN0YWJsZSBwb3J0cyBjb3JyZWN0bHkK
--------------6SWjO40PObieEso7p0DwfJTl
Content-Type: application/gzip; name="dmesg-1-decoded.txt.gz"
Content-Disposition: attachment; filename="dmesg-1-decoded.txt.gz"
Content-Transfer-Encoding: base64

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
g8HvpCrGOJfw13Lb0+APAnj2f2X4PTTXdwAA
--------------6SWjO40PObieEso7p0DwfJTl
Content-Type: application/gzip; name="dmesg-2-decoded.txt.gz"
Content-Disposition: attachment; filename="dmesg-2-decoded.txt.gz"
Content-Transfer-Encoding: base64

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
DNrRe+VR/h/U/7Vvg4AAAA==
--------------6SWjO40PObieEso7p0DwfJTl
Content-Type: application/gzip; name="lshw.gz"
Content-Disposition: attachment; filename="lshw.gz"
Content-Transfer-Encoding: base64

H4sICILd6WUAA2xzaHcA7F1pb9tI0v6+v6I+JsFI5qUTEDC27NhGrBkjdmay72Ah8GhJhHmF
hyXPr3+rSVHi0U22FB+Z7BK2ZZLdZFfVU9VV1Yci39K7thd3H/TI7ZLkX4CHRSIztIPY9r0x
nJPoIfYDmPpukMQkTEsEoW8lZjyG2V1nMB3J8O7eB4PAwnYcYoHxBL93L7qz7vu09CPxLD/E
wrYZ+p27WA/h2sNHeTp9he7gs7u/wE1sdbfFwyh9tdKV0gsRCW3dGQP7HWmRtW3FqzH0NTDs
OEovmXqgG7ZjxzaJxhC5hu1HHaU7BMu108/IDeAxeopM3XFUJavjewt7mYR6Rrvh+/HE80MX
22iu9Ciyo4m15cdCd23nacJuE0QPCe9WktjWpCf3tQWRBx3NGpqdviGbHX1kWB3FXEg9q9dX
h7KMLfrQMf2QpE2rymXmxysSGr4eWvn9vVROL+Gs15Pg/vfZ6dXpn5/g3VZQ7/OyB8qEPn31
FNnIK7CtMUj751SEVZDXpz5S2R9Iw9HujuPHjXJEihd26K71PdVVws+uf78r3MsJOXXxrabu
wYws9TjEq1GZIqTmZtot1GQTVKTptPuxeN3SYzIGWTqRRyeKpKiFW5H9N6Hw+2SfFa5SCJp2
/DQGVZnV7uzBGZg2JMEy1C0C0Uq3/LXtLcG0KP5SEEbEIWYMkW8+kJhYoe8CsSxAxZXVheMH
wZNHzOJp7Ecr29CLl9S+VDyVFal0PlBKp8pwmJ73ghD/IvsJ8ej56IE8paBLC2uZqNP/B2lJ
EqYn0qNtER+SyACqdykNATHtBTKcigMSsrBzibvE9cMnnrzvnqKYuCjWSqGS+FJt2QkjRdm2
XtZYPwS3rjA7wanKZUE8HzqG7j2Mi6KvNgqZKcHs6m94J3VV8KL38Bdxg/jpP+U6O4384j14
/tor382hy7zJRSfsFYxZMaP+/Ho2q1YzHcRP1va86djyKtlyA9npU8/PP2vIXc9chb7nJxE2
w0gWCxKiNr/74oVkaSPn8ex9nU0c9ny6+qoiHqdy/1w7kfuXX9mM+oRqEcV+E6dkNqckedo/
H40uuKyq1kthgS0paS0wO5oD+av8OLBSXhFW6j8aVioHVtMUVh/fDFboIOjmipRsVYm1NzKk
JbiGU6sZTqzSgWmlUtbyQX/I6+Hqt7Jmy5e0zXJXKoup0gHaAXFsj3SMJIxisLN+24F1aMd4
UTcfIPGw8yBF011x1hzySJyJXOaLzOWL0sKXXp0vCpcv/XrvnnGleuNNeKKUeaJweaK28KRf
54nK54nGZUr1zptwRd1xJUh4HJnefikyI7crp7Nz+Pz0N3pEI1BHkvQVZKUzRU8dbkPfJFHk
hywP1XrUPROtWepzY2D1aGNZ+Auf9h8uyweFOwYaRdtb+GPAJv/K9FgVtSvLard4j2/VMxGe
zrSa7DB2QFPDFB469Gr5Htd25XKVGA/bS9RxYREk9HdONiZJOQ9rDM1cgsKAICKA/ie4UQiB
TsA1CZibIeiBbSJtAbhxiHeW9I4Opus/YrGYVlP72IKFk0QrcN0NLDb4hAifhr8KrNCbzkI/
8Db0PtnEaZG5H2BtKyDy0oDQwlcHsBn2O0gewiiKdS+e0/aEJJgvfd8Czw8c2GBI6Dv+8glP
sZAfpGVQTLYF+GRrTpuL/+sBCRcu/QOhjvUCz0bv33ET55v1DV1Uz4592kpsPSxcpGcj92mD
tbmcfSiwUVLSkVAMogI/ML0YdMTRJtIfCeiPSKncx/ZZoe5Z4OirxRxZbLrB3MHIyHyC6NGl
bUqfYobD/LJuuOkrdHDtSHfspUeZpVoImiAkCxKbK/CjxzXYRoTxrY1NhbUVQ4wCodRTBlLC
zDic06h1d+JhDBAU7zoONn+t2/EGOWQgHOK5g6bHCujHaj0PkMsxlZNhgUuDGANLRTF+ICjc
VGaLaBkZOrbPcG2ZEq1gOI9gwFM07N9cKrm5jn8jggqnWxu8rQc5HqiITWdt0GBrjhJIWUcv
pv+YsFmS2HiU6YPSxtJP3zSTYHfmGu489mOaF9ieIdbpmfM3Qd22w1TE6eNIGMQhtiQIE1gb
nm97j9gitEXg4RsdI3ykEqH1H8BDyzNP5YjwmVN4EiTZNOamQzC0TRtvPOkRIskipm+RNCcR
Rwj5JMKIyqHxV7CIVyFBKh18D9oYeJw/uvSh+OH4ugWPS3uBF2lANkd5OJC4dkBbiI/10ZRg
BLieh/h8bFlimhSQVLci8kh/54g1BPYiJN/4JpYCIJrIChBPNzDM35271PbRlk9kTe715ZGk
AW2ubkUTRctNMgbEfJfmykfDb4S2tSQs40xzGRj8BiczbAuF8GcaRdP0lUM2wmb5F7j2zG6L
cZYkpnXG1v8q4TFOf7pMQ12qurWgqsKxoGrJ4n7oLIlHkx3w5bfpzen17OK8wbe+/n02+1K+
z2cVo/BRbKpySupWQg0us5Tq21n8amIZj2vZnVLP40Y27Qfw4txBLaoUrfgMaJE882kiFcRQ
RWmV9bfT6zpOG/l/eXsLZ4wazyIEuSsLCaFW7kWFQHNfgUs/yAb7mSjKxZLlXeeZnaNtnbs6
DQDF5GWFNjZ7Qh8b+GGlLL7GT0KTvt4Ov42VPmQpqPHCXFA2SB38Jz2K9T50PPRJyk+Cish/
+2NGvRYqllrBndhvf/s3TO9USZNAuT+Du7vzWtlc4LcrO0J36IKm/zAsts0ILVmIFKVk1l/R
kDQCtsDlqonKDvRl0gd5uov+4AmSdEKprxfcgSOlSFbrJXIHFMlWZEVSZKknDyVZon9qhZsC
YWhCFVSBRZtbgdUmxRaiDe/N8+utyAIeuNI37AwDeN+8Cf52FUnWutKw64fLLi2SvWcsj4YD
+stiQx0RkPpAEwdfVGtNBb5YiQFfSa3AF1IEozgjdOVJ1XBlBwPLdvTAKtmCNKgiaLVG57Za
rtieOhSOb4/S3p4M0UvJq7632Cbmc45sE5O+vUJSoPwqsbnA08Va29Njm2Ma9tVL+wzeIZ7e
s4pVrLAexjYlCfuWwv9jy6/rINQ7x6yBERopP6Tvn2jSCOOWyvkalTtVmi7Vg05P0khvpCqq
jL9S+impPfw7xE85/U3/2xZUJA3v4iGpmiopWKGnaYoi9fCqpnWk7GCw5EPn0XcSVFWOu7Q7
SpK9+HiN3fH9nhucSu1CBpacf+EV3UfaSnlUol6sIL7QdvWQBp+LvbwyB6Upnf/DOShiXmKt
3E/voAzA9mmpsYU8eJdq1FAeKe/3hr+XG/4hw29JIqPZbflyd0bbhy6G45CwVnaHB3wL3GF3
jiHgFGERkTitqnZl+HqFYJryn3EsQuAor0ZhezVcoMBzeh5bJ6OAmM0KQXS8o0Grz1emxYhC
8qOCmJ62h8ZQz6GhD1g+AaJjhSE12yPYiX5D5ZuG3g1Chr2cb2wv2UC/O+xKndAcdDyyiTvo
9miSKg1Say13lmjiNalHiCSrJGVSB6k8zt3YowDp+VWgH8VizFI7jPTRiWvvOfExHaXLwBPw
pLlKjDT1Gk1kCaKAEGuiDaUZou6E0dmm8mHLBhhajA/ndVS7QcO7M2wwXHFL5iK8JB6JniK4
oXzLNFSkE2R6TVCTENu7goIAhsOuyiskLgRokoOrbwJ/jSeyJLmnW7Fo7VIBnlndHeU5K05C
Yt+PV2hlQuJQk5COXCx0Rpy4O3YSO656LkY6C8ZJw0ae+EDQjQGGEKvJgnILcnPbZTlm+VGW
pbEjtkWqwBOsEdN5J1XRpiKVlWY947WyJM3LPP2G+saJ9bOjqHKdu2yqTLP1hELoj6XofBm4
J+bKywYXRFWwJ6iCvHI7waldiVcmD+tP/296vZKl6bnCVb/v19XAoSHCcTLlmZByUjlxdW+v
VYJynd1dw+zfd/fXU7i5vry6bxEpFheRHrPXgbr0eOXK/ZztBUnM4zYjtEzLnxBsM7eWiF7v
4IGhmiJJPVk5VYXxIXexa+SbVzZGqB9jW3uM9Noxsnd+mGT8iM5PSx6BIkMg/YHFmKWOcH7Q
+T/K+cl7WZmyoy6dD51Ij/XmsOXu9P702Lglrfsa8Qqjg+RGLPWiAhELM7qFgyIWympG2KLT
uENGX5ERukDou4LhC32MeOiiKYXQZZiHLiMa1RZu7MLdQT3cRQqaccPLe0ALZNY2HQT/EkRx
SHQXbmtxOzwnbuoKysVNvejr4IbmRuqwOTAxAoflRqCGGCREOD0yqKVHgDOUlx2iuIHi9KDD
RQ/fBRyoYKfPKsECjzqW+ow0CTTjB1ohBC0ogpcCEhyMJajDSd3jZtCIG0iHC0i89kPmAABU
c8p0BjqWb43edlD6M4/3Bkqf741V4zze8OD24a25FGCjRWMn1bKj7F+sHb022rNv7xZaBs+/
y33HgTnumePFcKzqYzIYjwac8i2pu+xoAyTUMOlmkNzjkdUNklymOVvFfFYj9HXLxGdNnrCH
2YLUXjtrDPm2p1s+TVrcSMgXzEzkQVdV5L6qaeoA1TrFTAcvJqn67AcqHdt7mHg+uIkT23kb
OM2u6EZfY+mGJPNsavuo3j/FpjKxx7Gpg//Z1KpN7eVdNNl10XRMsNBF93M49d/G1H6+vxnK
snwylPvDk6Emyyk0L7Zsu7SXyNp4/1zhPM5nojsxeUBn0rWRj/RlflhfXldt1rFGuidupIkX
9KJWKy23JYAUNNHSuGeNe/2xOhzL3IxANjB9yU+pFkc/m8u9lsVPJ40ImX2IA3BtG2TJiNM/
nYVFZwimZ/vT7X96EvseWfqx3dRTV9SuUmnie+xuJEQIjw7sRKyETo+cLBI6uTbvUMLYodqw
6ihzxFRXAUk5UfonMipzMEEHu4s3u1p3MKx2LrQxpd4FqO5P4jVdwkNnGNhhHv03irlqRbS6
FVF6ZSOibY2IpJUCxr11YU+MoZ1V+3SPf0pnNTqgsxr9r7Oqwowx3F7prHbxZO8NOyulB0q3
d2lc/KidkaIf1BlpSntvJGkH9kZNgxLbeTY9Vv6xcLxqZ/MYWC/R4VAif9Cup9zdKD1j390M
TmT1RJHaYpd67yLYn/Tril7uT/Z6LpUTkD05vyGX+hNmT/IjT7pSBWeF18r99JOuhjk4Frxe
wMzRQdJeIC8/MLeTEfNc5LA3VDFa1oalmZjPlKj+TX+kRgC+3pQz0+AvShFMlr0+Pl99cnp/
/RxzsxSjZW6WWQ+1nzdjXQfWq2esh3sQkR2IUs9UHHTWMaADHu7gOFe3gL5zf+0djj/4bgjC
YdPD9kA0ud6JmPPb4BAc7vw+Byjhe51fP0eZvJARYvJCWmR4Hb08LIEi07KjwNGfWO2ECkD/
uKRjv26AlBoOaRoGzo4yZBUV/vqsWwQdmc9foY/h4Qn9A1/v088ZE2bwHFiF7/CnrSZ/usmA
ZseLObIV5D4u9fleHsKjx9uHs8eQXWsZJA2jyNnBAjNCsDMwFoULBC9YGbIHu9HmPVLpze0B
+yq7m0TKb9Z0ouw87lTCXJSdR2unKzIvekz9W5dYdn0KRHaUdOE0sWxfcM5SBn/5BDXg6nx2
fXJ+u60uHEQ+I/a5swe56OdVKEeTph5aB8x5ijzrZAvY6YHVVuupdH5gncB0sZIsBcdUU4+q
NTiq1vCoWiNerZZuFUTSSvAsFkqwNwWeOUJi5ytLn9vpmOshVokOohXWm1pKbgoURl4yOz50
0jl53EngUNDuq/NTQO1LVTvX719QLBPe5DsQ7I6AOa9Q5k2urBWvzi3kDBPktDZMF26nldf/
VWlteAmL1gYWttDK5lJOawMP22nlTQKt0iosqIxWXpqtnVY2l3Jam2DYSiszrc2gVVhQGa28
Aa52Wtlcymlt4GE7rdzEZZVYYUllxDLnBgkRu2dTluRq2tHt8CTXdb6TE1YtprxAgtin9vqv
i/FZxal4lgTYQDABViv3syfAykv5W3cdgerSaN/rXKBkvZgue7imqYHExTPOzgVcYKR4OE9c
9wk+Jp7JrP2qiwsVcvTiwudIYJVAIZqf4m1fov0cOjwU1OFauZ9eh+W9qznKo06DsUR4q9xj
6bXV+zOJ6FCRBXe3t2+s14ufQa+hKM26g1sed/bM8CnbcE9kFUVNdlNa21+GerDCfmHqB/nu
h3B7dzt9SXmKLarIJPpWiyrqqs+bTSQ4umCagfgyiv5or/l6rvl6JRFlSMOtSZBGL7drQA6X
bKsAqXUh1fOhpB4IcFFSL/o6mwVwUPL6Owb0GD3FiL1a4mfcMYAZM9YWzTFLveKOAQJL019o
wwBZcMMA7HZEMr9imwSo7ZsEyF3tkHXH/PlALZzviW8K0JSoO4D/UBEBIp+3GxDsZXA3u5t+
f/qrJgahZf59qTtsWq1/iDzgWZQhO1q2aoDqyCL97orG4oX0DV2nD38Sw9RdmI64a+CzY2fq
0K7ExFw1bqqxfZVgYguYQmN0a8WjPmjSkCasla8NnRxVmY4ZKOcSz2pkR2HFOXd+eXbk8wAv
1NHgTL342Fj4oJ0JtlV44wEUYx09HUljLkEXMRwNpH2H4Wi03SBqvkEci3UgNhQuWHK1IcH7
3MZDfSHjcdBGEtmxtybX51svV8iKbCfzvpz5UFvMR0F0Tfu7AEfRWqoIbfIgH6hhDSbqezSs
aTslOGZHJRDP8tfl1lC42Ff3GphxqGU8cIsl5QfUvjvi0dRFoyChEJ2aJDyw+27uHxlyZCzs
Lzdl/+VrDeOAsO8V1dPhR7knydvJLAfqrNxocUFUZxWhzXsgV1m1deNOOHaDJihusmU7zln6
ZWFtJljY/grtyQQsyTcUFjS6h1rciugEw0yh/bKee1+6P65P4UY3IvEt6XgGscp4Xrkdz62u
/irR5gFb0AlHm5+239wn1qchuk1CW9WuB3k08/xhpyYUdmra4ZpwcFdWNWKjoZgNg918ALFe
KGcmXKrcrde2VQSn7QBzIoDS4GvXatTmAhz+tvEY5RDRvOhRdX038KPmjpxT9UH3eHMoG+t5
iXtsa1HpfMc5sHaBx66fRIyt9otHDdTPEFUeYCBmJNYtP4YOnOvRrmL5ZOp7UeKSME//thsS
9lOf30PWmjxkhkyPnjMjPLMoe42IjnDqtekHu1qzbrDrtOoFu5qITjBqNkzla2a9sMzSOg3e
c/NrGtpXdNQOzIpKTbsfwjGx8X/VBohM7a6N5TBL/TgbIGbHi4zmqF3lLUZztGcezUEyjvWv
8+xfr4H18KLDOb3emw3naC81nKMemSIq64OQTF4kU96sF/DimXLthTLlDYoC7XJRBOTyItkA
9U2zAZpQNqDpa1yEleP7NKNxsZj4MjH+NK+r8/YVYs83Z6fOde6cnXrR+oBmXUAtg5jCFVbr
qcxY+dUwzCmzhjmby9eXUjWWlw8sr9Tb81aT446f7CS6GKs6Q25YnAiXz42VmN+R0rAAqzAX
oJOpSZ5+/hgipKgitPq0Al+glq3eYIYbLbmaaiTUuMSKT81noodCxAh890pGDNO/biGmyoDG
NVR8YjA+Ye9rcODXyGWEMDvjFkKqxDcukGomBH5P4gxsrSQJzHLLslgCiKyRVGVD4zooAZLu
kjD0E689JBSI9zKqRL9er0BVjRM5VczcjgBV05uPF60UMR/Ookj0qw6LFNW/8jCjiJkyaTNv
V0S3gpUvoE7Mx7NoEgBpjaY9Hz50ssHO8kPK3xswO0sqvdeOzI/Tq+w+19t5nu+6q2CWvWCF
fpFo9eV5cFaRosCClX6/vmCFvbTEtjfaPHJpozjd6f9Xd3+9CcJAAMDf9yn6BZYB5Z/Zk7os
WbIHE81eF3S4LQ41yB727UfRiHBXWmpvGa8a8fyh9e5KS+u/9HJd0ech6bB/mo+7VxWJE/A8
mxLeZtBvF1lSfC7BD+zgNzKiku0iB+o8TZJVH/vtvoq8I7X/KY+dsQnaVldkJK38bQszTUl2
Vr0nGikcjusJhp3Y7+44kZCn72JntxwmnIq8gyBkON7Wu34uqisCbhdlKcamaKdbkV6YxpsX
q9dVtjugEcPR9BpkeDQCZPh/fk3I8Gg2Qob7mzcvRBK9cjDOaa1yrV4KRj+joa/5+2j83qT3
VnUab4rVgtLRDtZ/cDvE/6/kqZU8CiU+KCWuVuIUSv6glHy1kk+hFAxKKVArBRRK4aCUQrVS
RKEUDUopUivFFEqxodIJ5+4lzbM0zdmDuBXbY7IUy7dPn5y58cf9efML5lgWi5ViLonY6M/E
XMtiIx0x175Y4zoDWjLPMlmiQ+YRkJlm6P3JuGWypQ4Zt0l2fBgtfTauU5Y+l4US3gE6qZtm
/P3VfcvqKx11n+CLapr+9ycLLJO96ZAFBGSmtUB/stAyWapDFhKQmRYG/ckiy2RrHbLIGhmY
8z1TzMTFlWzyXRT1Rkd4IxKbK3TwJ9sTGucUo9Wr+kqK9S7PbpBp3DrAKZvv02RTd5HxviMW
niR2MNfn4PEde/9gUlbfjncEN9KLLVbQ/QIuYFQV9KYAAA==
--------------6SWjO40PObieEso7p0DwfJTl
Content-Type: application/gzip; name="lspci.gz"
Content-Disposition: attachment; filename="lspci.gz"
Content-Transfer-Encoding: base64

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
dt8ZxyTfGcI1wjXCtXfAtWrWN/8DQ6jDjmKgAQA=
--------------6SWjO40PObieEso7p0DwfJTl
Content-Type: application/gzip; name="lsusb.gz"
Content-Disposition: attachment; filename="lsusb.gz"
Content-Transfer-Encoding: base64

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

--------------6SWjO40PObieEso7p0DwfJTl--


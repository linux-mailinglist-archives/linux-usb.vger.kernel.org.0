Return-Path: <linux-usb+bounces-25289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D9AEDC17
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 13:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38BBA3A49B1
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 11:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A987B283FDD;
	Mon, 30 Jun 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="aYwNUjVe"
X-Original-To: linux-usb@vger.kernel.org
Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11A283FFA;
	Mon, 30 Jun 2025 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284580; cv=none; b=IYeCPjJeD+E2hVcXVMnDwwJA68J7UCTkQkUFjb2jwHxtgYCk0cCb68sJV/65phYL51KfWppeJqf321rSOB+/r5NQT+o89tVB9ehxVfVFlJIq3yPGvBH1pws1fySizmHTnIvH7HAt3MvNN31iWxesDCJRWKihSEcEFDPvWGcoyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284580; c=relaxed/simple;
	bh=zipmxPMf6FwPfMZQvEP5xoZzdSUP5H4zB4h14KVQPz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJvgIFPbCfTiaxTJtSp3QoJ/2cHPnSv2MWOBPzr0924wjCJkRKWVJjHCOiU9e3l7m+S/nFRdkaYoOmM+T0JEI2EYbrKgvCWx3v+RCH6k7gnjA5iYb5kYT4rvdM/eC14SFMPmkq1+3QpM2NuppXj/o7WlCPxVeUNouOs4nIpxY+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=aYwNUjVe; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mq0CG+Fxw1HUTxxUVu8mFHHpOoXaAo5CpKvjNvEmQ8E=; b=aYwNUjVeo2aJ/bCnO3xkjn7g8E
	J08RxmGH95DBe36d8usT09W26q80dUgJbZcDekeQBIRxSmQQPL5ejGd3rLguG4pIkNc9ZxSSny3St
	YbMlNAiLRG84S820eHip8aAdsXQFELrNTk1z/PvjnCFXV16ud3OiWINz1gMPygB/DVGYVvtawUV/+
	uaUiy2sIPTWo6oDUPXYIZbK/3QdiBDV24UAypgDIaKpw1Z1jlnXXX4ZJddcCiA8LH7RUuwOncJYMl
	RZqCaSLQ6Ic+IJBW9XDPj1gMvc1JlCROsL5PgjU/Oil1OjKiFjYn0ypJgYCq4mcxsOkezyJd37x3S
	jgXrVaUg==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:20030 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uWD7O-0000000HDOC-08lz;
	Mon, 30 Jun 2025 13:56:14 +0200
Message-ID: <787a075d-c26e-45ae-a2a2-8144c7f64a04@oss.cyber.gouv.fr>
Date: Mon, 30 Jun 2025 13:56:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] usb: core: Introduce usb authentication feature
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Kannappan R <r.kannappan@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
 <CACzwLxjJ3hx+PFVh2uWdVD1Pqw6HmUWtQiN+Q618ib2w+X3gww@mail.gmail.com>
Content-Language: en-US
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
In-Reply-To: <CACzwLxjJ3hx+PFVh2uWdVD1Pqw6HmUWtQiN+Q618ib2w+X3gww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 


On 6/21/25 12:21, Sabyrzhan Tasbolatov wrote:
> On Fri, Jun 20, 2025 at 7:27 PM <nicolas.bouchinet@oss.cyber.gouv.fr> wrote:
>> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>>
>> This includes the usb authentication protocol implementation bulk
>> exposed by the public usb_authenticate_device function.
>>
>> The protocol exchange is driven by the host and can be decomposed into
>> three, mostly independent, phases:
>>
>> - The Host can request a digest of each certificate own by the
>>    peripheral.
>> - If the Host does not recognize the peripheral from one of its digests,
>>    it can read one or more certificates from the device until a valid one
>>    is found.
>> - The Host can issue an authentication challenge to the peripheral.
>>
>> The usb_authenticate_device function implements the usb authentication
>> protocol.
>>
>> It implements the three phases of the protocol :
>>
>> First, it needs to communicate with the usb device in order to fetch its
>> certificate digests (usb_authent_req_digest).
>> Then if the device is unknown, the host fetches the device certificate
>> chains (usb_authent_read_cert_part, usb_authent_read_certificate).
>> Once at least a digest has been recognized or a certificate chain has
>> been validated the host challenges the device in order to authenticate
>> it (usb_authent_challenge_dev).
>>
>> It also needs to communicate with a policy engine using the following
>> functions :
>>
>> usb_policy_engine_check_digest
>> usb_policy_engine_check_cert_chain
>> usb_policy_engine_generate_challenge
>> usb_policy_engine_check_challenge
>>
>> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>> ---
>>   drivers/usb/core/authent.c | 631 +++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/usb/core/authent.h | 166 ++++++++++++
>>   2 files changed, 797 insertions(+)
>>
>> diff --git a/drivers/usb/core/authent.c b/drivers/usb/core/authent.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..46f048d45a909e0fef504d71072eb7854320d271
>> --- /dev/null
>> +++ b/drivers/usb/core/authent.c
>> @@ -0,0 +1,631 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * SPDX-FileCopyrightText: (C) 2025 ANSSI
>> + *
>> + * USB Authentication protocol implementation
>> + *
>> + * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> + * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>> + *
>> + */
>> +
>> +#include <linux/types.h>
>> +#include <linux/usb.h>
>> +#include <linux/usb/ch9.h>
>> +#include <linux/usb/hcd.h>
>> +#include <linux/usb/quirks.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/device.h>
>> +#include <linux/delay.h>
>> +#include <asm/byteorder.h>
>> +
>> +#include "authent_netlink.h"
>> +
>> +#include "authent.h"
>> +
>> +/**
>> + * usb_authent_req_digest - Check if device is known via its digest
>> + * @dev:               [in]  pointer to the usb device to query
>> + * @buffer:     [inout] buffer to hold request data
>> + * @digest:     [out] device digest
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * This function sends a digest request to the usb device.
>> + *
>> + * Possible errors:
>> + *  - ECOMM : failed to send or received a message to the device
>> + *  - EINVAL : if buffer or mask is NULL
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +static int usb_authent_req_digest(struct usb_device *dev, uint8_t *const buffer,
>> +                                 uint8_t digest[256], uint8_t *mask)
>> +{
>> +       int ret = 0;
>> +       struct usb_authent_digest_resp *digest_resp = NULL;
>> +
>> +       if (unlikely((buffer == NULL || mask == NULL))) {
>> +               pr_err("invalid arguments\n");
>> +               return -EINVAL;
>> +       }
>> +       ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
>> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +                                     USB_AUTHENT_DIGEST_REQ_TYPE,
>> +                             0, buffer, 260, USB_CTRL_GET_TIMEOUT);
>> +       if (ret < 0) {
>> +               pr_err("Failed to get digest: %d\n", ret);
>> +               ret = -ECOMM;
>> +               goto exit;
>> +       }
>> +
>> +       // Parse received digest response
>> +       digest_resp = (struct usb_authent_digest_resp *)buffer;
>> +       pr_notice("received digest response:\n");
>> +       pr_notice("     protocolVersion: %x\n", digest_resp->protocolVersion);
>> +       pr_notice("     messageType: %x\n", digest_resp->messageType);
>> +       pr_notice("     capability: %x\n", digest_resp->capability);
>> +       pr_notice("     slotMask: %x\n", digest_resp->slotMask);
>> +
>> +       *mask = digest_resp->slotMask;
> Wonder, if we might have a bug for BE hosts here.
> Spec says the slot bitmap is LE, for devices that set bit 7
> it will be mis-interpreted on BE.
>
>      int usb_authenticate_device(struct usb_device *dev)
>      {
>          ...
>          for (i = 0; i < 8; i++) {
>              if (1 == ((slot_mask >> i) & 1)) { /* bit-test */
>                  /* use digest at digests[i * 32] */
>                  ...
>              }
>          }
>      }
>
> That loop treats bit 0 as the LSB, so it does match the spec on both
> little- and big-endian hosts. There is no endian bug in the mask
> handling itself, AFAIU.
Indeed, we need to check the shift behavior on both architecture.
>
> What can bite us, however, is positional coupling between the mask and
> the digest array:
>
> The spec guarantees that digest k appears only if bit k is set and
> that digests are “returned in order of increasing slot number.”
>
> So if a device leaves gap(s) (e.g. slots 0 and 2 populated, slot 1
> empty) the firmware is allowed to pack the digests for 0 and 2
> contiguously. Our code assumes digest[k] is always at offset k*32,
> which fails in
> that sparse case.
 From what we understand of the specification, the firmaware should not be
allowed to pack digests in the response that should always be 260 bytes.
It is indeed not specified what the value of digests for unused slots should
be. For reference :

- In Table 5-7 of USB Authentication Mapping Specification: GET_DIGESTS
   Authentication IN Control Request Fields wLength is set to a fixed size
   of 260.

- In Table 5-11 of USB Security Foundation Specification: DIGESTS Response
   Payload digest offsets are given as 4 + (32 * (n-1))

>
>> +       memcpy(digest, digest_resp->digests, 256);
>> +
>> +       ret = 0;
>> +
>> +exit:
>> +
>> +       return ret;
>> +}
>> +
>> +struct usb_auth_cert_req {
>> +       uint16_t offset;
>> +       uint16_t length;
>> +} __packed;
>> +
>> +/**
>> + * @brief Request a specific part of a certificate chain from the device
>> + *
>> + * Context: task context, might sleep
>> + *
>> + * Possible errors:
>> + *  - ECOMM : failed to send or receive a message to the device
>> + *  - EINVAL : if buffer or cert_part is NULL
>> + *
>> + * @param [in]     dev       : handle to the USB device
>> + * @param [in,out] buffer    : buffer used for communication, caller allocated
>> + * @param [in]     slot      : slot in which to read the certificate
>> + * @param [in]     offset    : at which the certificate fragment must be read
>> + * @param [in]     length    : of the certificate fragment to read
>> + * @param [out]    cert_part : buffer to hold the fragment, caller allocated
>> + *
>> + * @return 0 on SUCCESS else an error code
>> + */
>> +static int usb_auth_read_cert_part(struct usb_device *dev, uint8_t *const buffer,
>> +                                  const uint8_t slot, const uint16_t offset,
>> +                                  const uint16_t length, uint8_t *cert_part)
>> +{
>> +       struct usb_auth_cert_req cert_req = { 0 };
>> +       int ret = -1;
>> +
>> +       if (unlikely(buffer == NULL || cert_part == NULL)) {
>> +               pr_err("invalid argument\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       cert_req.offset = offset;
>> +       cert_req.length = length;
>> +
>> +       // AUTH OUT request transfer
>> +       memcpy(buffer, &cert_req, sizeof(struct usb_auth_cert_req));
>> +       ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
>> +                             USB_DIR_OUT,
>> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +                                     USB_AUTHENT_CERTIFICATE_REQ_TYPE,
>> +                             (slot << 8), buffer,
>> +                             sizeof(struct usb_auth_cert_req),
>> +                             USB_CTRL_GET_TIMEOUT);
>> +       if (ret < 0) {
>> +               pr_err("Failed to send certificate request: %d\n", ret);
>> +               ret = -ECOMM;
>> +               goto cleanup;
>> +       }
>> +
>> +       // AUTH IN certificate read
>> +       ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
>> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +                                     USB_AUTHENT_CERTIFICATE_RESP_TYPE,
>> +                             (slot << 8), buffer, length + 4,
>> +                             USB_CTRL_GET_TIMEOUT);
>> +       if (ret < 0) {
>> +               pr_notice("Failed to get certificate from peripheral: %d\n", ret);
>> +               ret = -ECOMM;
>> +               goto cleanup;
>> +       }
>> +
>> +       // TODO: parse received header
>> +       memcpy(cert_part, buffer + 4, length);
>> +
>> +       ret = 0;
>> +
>> +cleanup:
>> +
>> +       return ret;
>> +}
>> +
>> +/**
>> + * usb_authent_read_certificate - Read a device certificate
>> + * @dev:               [in] pointer to the usb device to query
>> + * @buffer:            [inout] buffer to hold request data, caller allocated
>> + * @slot:              [in] certificate chain to be read
>> + * @cert_der:   [out] buffer to hold received certificate chain
>> + * @cert_len:   [out] length of received certificate
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * Possible errors:
>> + *  - EINVAL : NULL pointer or invalid slot value
>> + *  - ECOMM  : failed to send request to device
>> + *  - ENOMEM : failed to allocate memory for certificate
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +static int usb_authent_read_certificate(struct usb_device *dev, uint8_t *const buffer,
>> +                                       uint8_t slot, uint8_t **cert_der, size_t *cert_len)
>> +{
>> +       uint16_t read_offset = 0;
>> +       uint16_t read_length = 0;
>> +       uint8_t chain_part[64] = { 0 };
>> +
>> +       if (unlikely(slot >= 8 || buffer == NULL || cert_der == NULL || cert_len == NULL)) {
>> +               pr_err("invalid arguments\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       // First request to get certificate chain length
>> +       if (usb_auth_read_cert_part(dev, buffer, slot, 0,
>> +                                   USB_AUTH_CHAIN_HEADER_SIZE,
>> +                                   chain_part) != 0) {
>> +               pr_err("Failed to get first certificate part\n");
>> +               return -ECOMM;
>> +       }
>> +
>> +       // Extract total length
>> +       *cert_len = ((uint16_t *)chain_part)[0];
>> +       pr_notice("Received header of chain with length: %ld\n",
>> +              (*cert_len) + USB_AUTH_CHAIN_HEADER_SIZE);
>> +
>> +       // Allocate certificate DER buffer
>> +       *cert_der = kzalloc(*cert_len, GFP_KERNEL);
>> +       if (!(*cert_der))
>> +               return -ENOMEM;
>> +
>> +       // Write the chain header at the beginning of the chain.
>> +       memcpy(*cert_der, chain_part, USB_AUTH_CHAIN_HEADER_SIZE);
>> +       // Read the certificate chain starting after the header.
>> +       read_offset = USB_AUTH_CHAIN_HEADER_SIZE;
>> +
>> +       while (read_offset < *cert_len) {
>> +               read_length = (*cert_len - read_offset) >= 64 ? 64 : (*cert_len - read_offset);
>> +
>> +               if (usb_auth_read_cert_part(dev, buffer, slot, read_offset,
>> +                                           read_length, chain_part) != 0) {
>> +                       pr_err("USB AUTH: Failed to get certificate part\n");
>> +                       return -ECOMM;
>> +               }
>> +
>> +               memcpy(*cert_der + read_offset, chain_part, read_length);
>> +
>> +               read_offset += read_length;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * usb_authent_challenge_dev - Challenge a device
>> + * @dev:                               [in] pointer to the usb device to query
>> + * @buffer:                    [in] pointer to the buffer allocated for USB query
>> + * @slot:                              [in] certificate chain to be used
>> + * @slot_mask: [in] slot mask of the device
>> + * @nonce:                     [in] nonce to use for the challenge, 32 bytes long
>> + * @chall:                     [out] buffer for chall response, 204 bytes long, caller allocated
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * Possible errors:
>> + *  - EINVAL : NULL input pointer or invalid slot value
>> + *  - ECOMM  : failed to send or receive message from the device
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +static int usb_authent_challenge_dev(struct usb_device *dev, uint8_t *buffer,
>> +       const uint8_t slot, const uint8_t slot_mask, const uint8_t *const nonce,
>> +       uint8_t *const chall)
>> +{
>> +       int ret = -1;
>> +
>> +       if (unlikely(buffer == NULL || slot >= 8 || nonce == NULL)) {
>> +               pr_err("invalid arguments\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       // AUTH OUT challenge request transfer
>> +       memcpy(buffer, nonce, 32);
>> +       ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
>> +                             USB_DIR_OUT,
>> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +                                     USB_AUTHENT_CHALLENGE_REQ_TYPE,
>> +                             (slot << 8), buffer, 32, USB_CTRL_GET_TIMEOUT);
>> +       if (ret < 0) {
>> +               pr_err("Failed to send challenge request: %d\n", ret);
>> +               ret = -ECOMM;
>> +               goto cleanup;
>> +       }
>> +
>> +       // Complete the challenge with the request
>> +       chall[1] = USB_SECURITY_PROTOCOL_VERSION;
>> +       chall[0] = USB_AUTHENT_CHALLENGE_REQ_TYPE;
>> +       chall[2] = slot;
>> +       chall[3] = 0x00;
>> +       memcpy(chall+4, nonce, 32);
>> +
>> +       // AUTH IN challenge response transfer
>> +       ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
>> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
>> +                                     USB_AUTHENT_CHALLENGE_RESP_TYPE,
>> +                             (slot << 8) + slot_mask, buffer, 168,
>> +                             USB_CTRL_GET_TIMEOUT);
>> +       if (ret < 0) {
>> +               pr_err("Failed to get challenge response: %d\n", ret);
>> +               ret = -ECOMM;
>> +               goto cleanup;
>> +       }
>> +
>> +       pr_notice("received challenge response\n");
>> +
>> +       // Complete last part of the challenge with what is returned by the device
>> +       memcpy(chall+USB_AUTH_CHAIN_HEADER_SIZE, buffer, 168);
>> +
>> +       ret = 0;
>> +
>> +cleanup:
>> +
>> +       return ret;
>> +}
>> +
>> +/**
>> + * @brief Create a device context according to USB Type-C Authentication Specification, chapter 5.5
>> + *     1. Device Descriptor
>> + *     2. Complete BOS Descriptor (if present)
>> + *     3. Complete Configuration 1 Descriptor
>> + *     4. Complete Configuration 2 Descriptor (if present)
>> + *     5. ...
>> + *     6. Complete Configuration n Descriptor (if present)
>> + *
>> + * Possible error codes:
>> + *  - EINVAL : invalid dev, ctx or size
>> + *
>> + * @param [in] dev       : handle to the USB device
>> + * @param [in, out] ctx  : buffer to hold the device context, caller allocated
>> + * @param [in] buf_size  : available size in the context buffer
>> + * @param [out] ctx_size : total size of the context if return equals 0
>> + *
>> + * @return 0 or error code
>> + */
>> +static int usb_auth_create_dev_ctx(struct usb_device *dev, uint8_t *ctx,
>> +                                                       const size_t buf_size, size_t *ctx_size)
>> +{
>> +       int desc_size = 0;
>> +
>> +       if (unlikely(dev == NULL || ctx == NULL)) {
>> +               pr_err("invalid inputs\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       *ctx_size = 0;
>> +
>> +       // Device descriptor
>> +       if (buf_size < (size_t)dev->descriptor.bLength) {
>> +               pr_err("buffer too small\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       memcpy(ctx, (void *) &dev->descriptor, (size_t) dev->descriptor.bLength);
>> +
>> +       *ctx_size += (size_t) dev->descriptor.bLength;
>> +
>> +       // Device BOS and capabilities
>> +       if (unlikely(dev->bos == NULL || dev->bos->desc == NULL)) {
>> +               pr_err("invalid BOS\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       desc_size = le16_to_cpu(dev->bos->desc->wTotalLength);
>> +
>> +       if (buf_size < (*ctx_size + desc_size)) {
>> +               pr_err("buffer too small\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       memcpy(ctx + (*ctx_size), (void *) dev->bos->desc, desc_size);
>> +
>> +       *ctx_size += desc_size;
>> +
>> +       // Device configuration descriptor
>> +       if (unlikely(dev->config == NULL)) {
>> +               pr_err("invalid configuration\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       desc_size = le16_to_cpu(dev->config->desc.wTotalLength);
>> +
>> +       if (buf_size < (*ctx_size + desc_size)) {
>> +               pr_err("buffer too small\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       memcpy(ctx + (*ctx_size), (void *) &dev->config->desc, 9);
> What is 9 byte size for? Can not find 9 in spec "chapter 5.5 Context Hash".
> Do we want to copy the entire config descriptor(s) instead?
> If yes, then we might use dev->rawdescriptors[] which has wTotalLength.
> If no, the comment of 9 explanation will be useful here.
We have added a loop to collect all device configurations.
We used the value 9 as it is the standard size of a configuration 
descriptor in
chapter 9.6.3 of the usb spec 2.0. We will however check if we can use a 
more
dynamic field.
The specification is not completely clear about the content that should be
included in the context. We need to spend more time to validate the context
creation part to ensure every configuration scenarios are taken into 
account.

>
>> +
>> +       *ctx_size += 9;
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * @brief Check that the authentication can resume after a sleep
>> + *
>> + * @param [in] dev : the usb device
>> + * @param [in] hub : the parent hub
>> + *
>> + * Possible error codes:
>> + *  - ENODEV : hub has been disconnected
>> + *
>> + * @return 0 if possible to resume, else an error code
>> + */
>> +static int usb_auth_try_resume(struct usb_device *dev, struct usb_device *hub)
>> +{
>> +       // Test if the hub or the device has been disconnected
>> +       if (unlikely(hub == NULL || dev == NULL ||
>> +                    dev->port_is_suspended == 1 ||
>> +                    dev->reset_in_progress == 1)) {
>> +               return -ENODEV;
>> +       }
>> +
>> +       // TODO: test if the device has not been disconnected
>> +       // TODO: test if the device has not been disconnected then replaced with another one
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * usb_authenticate_device - Challenge a device
>> + * @dev:               [inout] pointer to device
>> + *
>> + * Context: task context, might sleep.
>> + *
>> + * Authentication is done in the following steps:
>> + *  1. Get device certificates digest to determine if it is already known
>> + *       if yes, go to 3.
>> + *  2. Get device certificates
>> + *  3. Challenge device
>> + *  4. Based on previous result, determine if device is allowed under local
>> + *     security policy.
>> + *
>> + * Possible error code:
>> + *  - ENOMEM : failed to allocate memory for exchange
>> + *  - TODO: complete all possible error case
>> + *
>> + * Return: If successful, zero. Otherwise, a negative  error number.
>> + */
>> +int usb_authenticate_device(struct usb_device *dev)
>> +{
>> +       int ret = 0;
>> +
>> +       uint8_t is_valid = 0;
>> +       uint8_t is_known = 0;
>> +       uint8_t is_blocked = 0;
>> +       uint8_t chain_nb = 0;
>> +       uint8_t slot_mask = 0;
>> +       uint8_t slot = 0;
>> +       uint8_t digests[256] = { 0 };
>> +       uint8_t nonce[32] = {0};
>> +       uint8_t chall[204] = {0};
>> +       uint32_t dev_id = 0;
>> +       size_t ctx_size = 0;
>> +       int i = 0;
>> +
>> +       uint8_t *cert_der = NULL;
>> +       size_t cert_len = 0;
>> +
>> +       if (unlikely(dev == NULL || dev->parent == NULL))
>> +               return -ENODEV;
>> +
>> +       struct usb_device *hub = dev->parent;
>> +
>> +       // By default set authorization status at false
>> +       dev->authorized = 0;
>> +       dev->authenticated = 0;
>> +
>> +       uint8_t *buffer = NULL;
>> +       // Buffer to hold responses
>> +       buffer = kzalloc(512, GFP_KERNEL);
>> +       if (!buffer)
>> +               return -ENOMEM;
>> +
>> +       pr_notice("start of device authentication\n");
>> +
>> +       /*
>> +        * Send DIGEST request to determine if it is a known device
>> +        */
>> +       ret = usb_authent_req_digest(dev, buffer, digests, &slot_mask);
>> +       if (ret != 0) {
>> +               pr_err("failed to get digest: %d\n", ret);
>> +               goto cleanup;
>> +       }
>> +       pr_notice("received digest\n");
>> +
>> +       usb_unlock_device(hub);
>> +       ret = usb_policy_engine_check_digest(dev->route, digests, slot_mask,
>> +                                            &is_known, &is_blocked, &dev_id);
>> +       if (ret != 0) {
>> +               pr_err("failed to check digest: %d\n", ret);
>> +               usb_lock_device(hub);
>> +               goto cleanup;
>> +       }
>> +       pr_info("waking up\n");
>> +       usb_lock_device(hub);
>> +       ret = usb_auth_try_resume(dev, hub);
>> +       if (unlikely(ret != 0)) {
>> +               pr_err("failed to resume: %d\n", ret);
>> +               goto cleanup;
>> +       }
>> +
>> +       pr_info("resuming\n");
>> +
>> +       /*
>> +        * If the device is already known and blocked, reject it
>> +        */
>> +       if (is_known && is_blocked) {
>> +               ret = 0;
>> +               goto cleanup;
>> +       }
>> +
>> +       /*
>> +        * If device is not already known try to obtain a valid certificate
>> +        * Iterate over every device certificate slots, it gets them one by one
>> +        * in order to avoid spamming the device.
>> +        */
>> +       if (!is_known) {
>> +               // Iterate over slot containing a certificate until a valid one is found
>> +               for (i = 0; i < 8; i++) {
>> +                       // Test if slot contains a certificate chain
>> +                       if (1 == ((slot_mask >> i) & 1)) {
>> +                               ret = usb_authent_read_certificate(dev, buffer,
>> +                                                                  chain_nb,
>> +                                                                  &cert_der,
>> +                                                                  &cert_len);
>> +                               if (ret != 0) {
>> +                                       // Failed to read device certificate, abort authentication
>> +                                       // Apply security policy on failed device
>> +                                       goto cleanup;
>> +                               }
>> +                               pr_notice("received certificate\n");
>> +
>> +                               // validate the certificate
>> +                               usb_unlock_device(hub);
>> +                               ret = usb_policy_engine_check_cert_chain(
>> +                                       dev->route, digests + i * 32, cert_der,
>> +                                       cert_len, &is_valid, &is_blocked,
>> +                                       &dev_id);
>> +                               if (ret != 0) {
>> +                                       pr_err("failed to validate certificate: %d\n", ret);
>> +                                       usb_lock_device(hub);
>> +                                       goto cleanup;
>> +                               }
>> +                               pr_notice("validated certificate\n");
>> +                               usb_lock_device(hub);
>> +
>> +                               ret = usb_auth_try_resume(dev, hub);
>> +                               if (unlikely(ret != 0)) {
>> +                                       pr_err("failed to resume: %d\n", ret);
>> +                                       goto cleanup;
>> +                               }
>> +
>> +                               pr_info("resuming\n");
>> +
>> +                               if (is_valid && !is_blocked) {
>> +                                       // Found a valid and authorized certificate,
>> +                                       // continue with challenge
>> +                                       slot = i;
>> +                                       break;
>> +                               } else if (is_valid && is_blocked) {
>> +                                       // Found a valid and unauthorized certificate,
>> +                                       // reject device
>> +                                       ret = 0;
>> +                                       goto cleanup;
>> +                               }
>> +                       }
>> +               }
>> +       } else {
>> +               // Pick a slot among the valid ones, take first one
>> +               for (i = 0; i < 8; i++) {
>> +                       if (1 == ((is_known >> i) & 1)) {
>> +                               slot = i;
>> +                               break;
>> +                       }
>> +               }
>> +       }
>> +
>> +       /*
>> +        * Authenticate the device with a challenge request
>> +        */
>> +       // Obtain a nonce for the challenge
>> +       usb_unlock_device(hub);
>> +       ret = usb_policy_engine_generate_challenge(dev_id, nonce);
>> +       if (ret != 0) {
>> +               pr_err("failed to generate challenge: %d\n", ret);
>> +               usb_lock_device(hub);
>> +               goto cleanup;
>> +       }
>> +       pr_notice("generated challenge\n");
>> +       usb_lock_device(hub);
>> +
>> +       ret = usb_auth_try_resume(dev, hub);
>> +       if (unlikely(ret != 0)) {
>> +               pr_err("failed to resume: %d\n", ret);
>> +               goto cleanup;
>> +       }
>> +
>> +       pr_info("resuming\n");
>> +
>> +       // Send a challenge request
>> +       ret = usb_authent_challenge_dev(dev, buffer, slot, slot_mask, nonce,
>> +                                       chall);
>> +       if (ret != 0) {
>> +               pr_err("failed to challenge device: %d\n", ret);
>> +               goto cleanup;
>> +       }
>> +       pr_notice("validated challenge\n");
>> +
>> +       // Create device context
>> +       ret = usb_auth_create_dev_ctx(dev, buffer, 512, &ctx_size);
>> +       if (ret != 0) {
>> +               pr_err("failed to create context: %d\n", ret);
>> +               goto cleanup;
>> +       }
>> +
>> +       // Validate the challenge
>> +       usb_unlock_device(hub);
>> +       ret = usb_policy_engine_check_challenge(dev_id, chall, buffer, ctx_size,
>> +                                               &is_valid);
>> +       if (ret != 0) {
>> +               pr_err("failed to check challenge: %d\n", ret);
>> +               usb_lock_device(hub);
>> +               goto cleanup;
>> +       }
>> +       pr_notice("checked challenge\n");
>> +       usb_lock_device(hub);
>> +
>> +       ret = usb_auth_try_resume(dev, hub);
>> +       if (unlikely(ret != 0)) {
>> +               pr_err("failed to resume: %d\n", ret);
>> +               goto cleanup;
>> +       }
>> +
>> +       pr_info("resuming\n");
>> +
>> +       // Apply authorization decision
>> +       if (is_valid) {
>> +               dev->authorized = 1;
>> +               dev->authenticated = 1;
>> +       }
>> +
>> +       ret = 0;
>> +
>> +cleanup:
>> +       kfree(buffer);
>> +       kfree(cert_der);
>> +
>> +       return 0;
> In every early-error path `ret` is set but thrown away here.
> Enumeration thus always continues and hub believes the device is authenticated.
> Please return `ret`.
It will be fixed in the next version of the patch.
>
>> +}
>> diff --git a/drivers/usb/core/authent.h b/drivers/usb/core/authent.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c3852636dbcea9150ed1663769e2a7b6348f528c
>> --- /dev/null
>> +++ b/drivers/usb/core/authent.h
>> @@ -0,0 +1,166 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * SPDX-FileCopyrightText: (C) 2025 ANSSI
>> + *
>> + * USB Authentication protocol definition
>> + *
>> + * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> + * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>> + *
>> + */
>> +
>> +#ifndef __USB_CORE_AUTHENT_H_
>> +#define __USB_CORE_AUTHENT_H_
>> +
>> +#include <linux/types.h>
>> +#include <linux/usb.h>
>> +#include <linux/usb/ch11.h>
>> +#include <linux/usb/hcd.h>
>> +
>> +/* From USB Type-C Authentication spec, Table 5-2 */
>> +#define USB_AUTHENT_CAP_TYPE 0x0e
>> +
>> +/* From USB Security Foundation spec, Table 5-2 */
>> +#define USB_SECURITY_PROTOCOL_VERSION 0x10
>> +
>> +#define AUTH_IN 0x18
>> +#define AUTH_OUT 0x19
>> +
>> +/* USB_DT_AUTHENTICATION_CAP */
>> +struct usb_authent_cap_descriptor {
>> +       __u8  bLength;
>> +       __u8  bDescriptorType;
>> +       __u8  bDevCapabilityType; /* Shall be set to USB_AUTHENT_CAP_TYPE */
>> +       /*
>> +        * bit 0: set to 1 if firmware can be updated
>> +        * bit 1: set to 1 to indicate the Device changes interface when updated
>> +        * bits 2-7: reserved, set to 0
>> +        */
>> +       __u8  bmAttributes;
>> +       __u8  bcdProtocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8  bcdCapability; /* Set to 0x01 */
>> +
>> +} __packed;
>> +
>> +/* Certificate chain header, Table 3-1 */
>> +struct usb_cert_chain_hd {
>> +       __u16 length; /* Chain total length including header, little endian */
>> +       __u16 reserved; /* Shall be set to zero */
>> +       __u8 rootHash[32]; /* Hash of root certificate, big endian */
>> +} __packed;
>> +
>> +/* From USB Security Foundation spec, Table 5-3 and Table 5-9 */
>> +#define USB_AUTHENT_DIGEST_RESP_TYPE 0x01
>> +#define USB_AUTHENT_CERTIFICATE_RESP_TYPE 0x02
>> +#define USB_AUTHENT_CHALLENGE_RESP_TYPE 0x03
>> +#define USB_AUTHENT_ERROR_TYPE 0x7f
>> +#define USB_AUTHENT_DIGEST_REQ_TYPE 0x81
>> +#define USB_AUTHENT_CERTIFICATE_REQ_TYPE 0x82
>> +#define USB_AUTHENT_CHALLENGE_REQ_TYPE 0x83
>> +
>> +#define USB_AUTH_DIGEST_SIZE 32
>> +#define USB_AUTH_CHALL_SIZE 32
>> +
>> +#define USB_AUTH_CHAIN_HEADER_SIZE 36
>> +
>> +/* USB Authentication GET_DIGEST Request Header */
>> +struct usb_authent_digest_req_hd {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
> nit: shall we follow camelcase as in spec or keep Linux underscore style?
We used the same convention as in `ch9.h` but we will adapt it to the
maintainers preferences.
>
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_DIGEST_REQ_TYPE */
>> +       __u8 param1; /* Reserved */
>> +       __u8 param2; /* Reserved */
>> +} __packed;
>> +
>> +/* USB Authentication GET_CERTIFICATE Request Header */
>> +struct usb_authent_certificate_req_hd {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CERTIFICATE_REQ_TYPE */
>> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
>> +       __u8 param2; /* Reserved */
>> +} __packed;
>> +
>> +/* USB Authentication GET_CERTIFICATE Request */
>> +struct usb_authent_certificate_req {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CERTIFICATE_REQ_TYPE */
>> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
>> +       __u8 param2; /* Reserved */
>> +       __u16 offset; /* Read index of Certificate Chain in bytes and little endian*/
>> +       __u16 length; /* Length of read request, little endian */
>> +} __packed;
>> +
>> +/* USB Authentication CHALLENGE Request Header */
>> +struct usb_authent_challenge_req_hd {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_REQ_TYPE */
>> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
>> +       __u8 param2; /* Reserved */
>> +} __packed;
>> +
>> +/* USB Authentication CHALLENGE Request Header */
>> +struct usb_authent_challenge_req {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_REQ_TYPE */
>> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
>> +       __u8 param2; /* Reserved */
>> +       __u32 nonce; /* Random Nonce chosen for the challenge */
>> +} __packed;
>> +
>> +/* USB Authentication DIGEST response Header */
>> +struct usb_authent_digest_resp {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_DIGEST_RESP_TYPE */
>> +       __u8 capability; /* Shall be set to 0x01 */
>> +       __u8 slotMask; /* Bit set to 1 if slot is set, indicates number of digests */
>> +       __u8 digests[8][32]; /* List of digests */
>> +} __packed;
>> +
>> +/* USB Authentication CERTIFICATE response Header */
>> +struct usb_authent_certificate_resp_hd {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CERTIFICATE_RESP_TYPE */
>> +       __u8 slotNumber; /* Slot number of certificate chain returned */
>> +       __u8 param2; /* Reserved */
>> +} __packed;
>> +
>> +/* USB Authentication CHALLENGE response Header */
>> +struct usb_authent_challenge_resp_hd {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_RESP_TYPE */
>> +       __u8 slotNumber; /* Slot number of certificate chain returned */
>> +       __u8 slotMask; /* Bit set to 1 if slot is set */
>> +} __packed;
>> +
>> +/* USB Authentication CHALLENGE response */
>> +struct usb_authent_challenge_resp {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_RESP_TYPE */
>> +       __u8 slotNumber; /* Slot number of certificate chain returned */
>> +       __u8 slotMask; /* Bit set to 1 if slot is set */
>> +       __u8 minProtocolVersion;
>> +       __u8 maxProtocolVersion;
>> +       __u8 capabilities; /* Shall be set to 0x01 */
>> +       __u8 orgName; /* Organisation Name, USB-IF: 0 */
>> +       __u32 certChainHash; /* SHA256 digest of certificate chain, big endian */
>> +       __u32 salt; /* Chosen by responder */
>> +       __u32 contextHash; /* SHA256 digest of product information, big endian */
>> +       __u64 signature; /* ECDSA signature of request and response */
>> +} __packed;
>> +
>> +/* USB Authentication error codes, Foundation Table 5-18 */
>> +#define USB_AUTHENT_INVALID_REQUEST_ERROR 0x01
>> +#define USB_AUTHENT_UNSUPPORTED_PROTOCOL_ERROR 0x02
>> +#define USB_AUTHENT_BUSY_ERROR 0x03
>> +#define USB_AUTHENT_UNSPECIFIED_ERROR 0x04
>> +
>> +/* USB Authentication response header */
>> +struct usb_authent_error_resp_hd {
>> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VERSION */
>> +       __u8 messageType; /* Shall be set to USB_AUTHENT_ERROR_TYPE */
>> +       __u8 errorCode;
>> +       __u8 errorData;
>> +} __packed;
>> +
>> +int usb_authenticate_device(struct usb_device *dev);
>> +
>> +#endif /* __USB_CORE_AUTHENT_H_ */
>>
>> --
>> 2.50.0
>>

